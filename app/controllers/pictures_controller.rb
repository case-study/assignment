class PicturesController < ApplicationController
  before_action :verify_and_set_monument
  before_action :set_picture, only: [:show, :edit, :update, :destroy]

  def index
    @pictures = @monument.pictures
  end

  def show
  end

  def new
    @picture = @monument.pictures.build
  end

  def edit
  end

  def create
    @picture = @monument.pictures.create(picture_params)

    if @picture.save
      redirect_to [@monument, @picture], notice: 'Picture was successfully created.'
    else
      render :new
    end
  end

  def update
    if @picture.update(picture_params)
      redirect_to [@monument, @picture], notice: 'Picture was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @picture.destroy
    redirect_to pictures_url, notice: 'Picture was successfully destroyed.'
  end

  private

  def verify_and_set_monument
    unless @monument = current_user.monuments.where(id: params[:monument_id]).first

      flash[:alert] = 'Monument not found.'
      redirect_to controller: "collections", action: "index"
    end
  end

  def set_picture
    @picture = Picture.find(params[:id])
  end

  def picture_params
    params.require(:picture).permit(:name, :description, :taken_on, :photo)
  end

end

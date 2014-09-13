class CollectionsController < ApplicationController
  before_action :set_collection, only: [:show, :edit, :update, :destroy]

  def index
    @collections = current_user.collections
  end

  def show
  end

  def new
    @collection = current_user.collections.new
  end

  def edit
  end

  def create
    @collection = current_user.collections.new(collection_params)

    if @collection.save
      redirect_to @collection, notice: 'Collection was successfully created.'
    else
      render :new
    end
  end

  def update
    if @collection.update(collection_params)
      redirect_to @collection, notice: 'Collection was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @collection.destroy
    redirect_to collections_url, notice: 'Collection was successfully destroyed.'
  end

  private

  def set_collection
    unless @collection = current_user.collections.where(id: params[:id]).first
      flash[:alert] = 'Collection not found.'
      redirect_to action: "index"
    end
  end

  def collection_params
    params.require(:collection).permit(:name)
  end

end

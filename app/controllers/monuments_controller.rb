class MonumentsController < ApplicationController
  before_action :verify_and_set_collection, except: [:search]
  before_action :set_monument, only: [:show, :edit, :update, :destroy]

  def index
    @monuments = current_user.monuments.where(:collection_id => params[:collection_id])
  end

  def show
  end

  def new
    @monument = current_user.monuments.build(:collection_id => @collection.id)
  end

  def edit
  end

  def create
    @monument = current_user.monuments.create(monument_params)

    if @monument.save
      redirect_to [@collection, @monument], notice: 'Monument was successfully created.'
    else
      render :new
    end
  end

  def update
    if @monument.update(monument_params)
      redirect_to [@collection, @monument], notice: 'Monument was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @monument.destroy
    redirect_to collection_monuments_url(@collection), notice: 'Monument was successfully destroyed.'
  end

  def search
    @monuments = nil
    if request.post? && params[:keywords].present?
      if params[:search_by] == "name"
        @monuments = current_user.monuments.where("name LIKE  ?", "%#{params[:keywords]}%")
      else
        @monuments = current_user.monuments.tagged_with(params[:keywords].split(","), :any => true, :wild => true)
      end
    end
  end

  private

  def verify_and_set_collection
    unless @collection = current_user.collections.where(id: params[:collection_id]).first
      flash[:alert] = 'Collection not found.'
      redirect_to controller: "collections", action: "index"
    end
  end

  def set_monument
    unless @monument = current_user.monuments.where(id: params[:id], :collection_id => @collection.id).first
      flash[:alert] = 'Monument not found.'
      redirect_to action: "index"
    end
  end

  def monument_params
    temp_params = params.require(:monument).permit(:name, :description, :category_list)
    temp_params["collection_id"] = @collection.id
    temp_params
  end

end

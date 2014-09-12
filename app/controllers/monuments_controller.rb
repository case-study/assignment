class MonumentsController < ApplicationController
  before_action :verify_and_set_collection
  before_action :set_monument, only: [:show, :edit, :update, :destroy]

  # GET /monuments
  # GET /monuments.json
  def index
    @monuments = @collection.monuments
  end

  # GET /monuments/1
  # GET /monuments/1.json
  def show
  end

  # GET /monuments/new
  def new
    @monument = @collection.monuments.build
  end

  # GET /monuments/1/edit
  def edit
  end

  # POST /monuments
  # POST /monuments.json
  def create
    @monument = @collection.monuments.create(monument_params)

    respond_to do |format|
      if @monument.save
        format.html { redirect_to([@collection, @monument], notice: 'Monument was successfully created.') }
        format.json { render :show, status: :created, location: @monument }
      else
        format.html { render :new }
        format.json { render json: @monument.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /monuments/1
  # PATCH/PUT /monuments/1.json
  def update
    respond_to do |format|
      if @monument.update(monument_params)
        format.html { redirect_to([@collection, @monument], notice: 'Monument was successfully updated.') }
        format.json { render :show, status: :ok, location: @monument }
      else
        format.html { render :edit }
        format.json { render json: @monument.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /monuments/1
  # DELETE /monuments/1.json
  def destroy
    @monument.destroy
    respond_to do |format|
      format.html { redirect_to collection_monuments_url(@collection), notice: 'Monument was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def verify_and_set_collection
      unless @collection = current_user.collections.where(id: params[:collection_id]).first
        flash[:alert] = 'Collection not found.'
        redirect_to controller: "collections", action: "index"
      end
    end

    def set_monument
      unless @monument = @collection.monuments.where(id: params[:id]).first
        flash[:alert] = 'Monument not found.'
        redirect_to action: "index"
      end
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def monument_params
      params.require(:monument).permit(:name, :description)
    end
end

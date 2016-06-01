class AnimalImagesController < ApplicationController
  before_action :set_animal_image, only: [:show, :edit, :update, :destroy]
  before_filter :custom_user_auth, only: [:edit, :update, :destroy]

  # GET /animal_images
  # GET /animal_images.json
  def index
    @animal_images = AnimalImage.all
  end

  # GET /animal_images/1
  # GET /animal_images/1.json
  def show
  end

  # GET /animal_images/new
  def new
    @animal_image = AnimalImage.new
  end

  # GET /animal_images/1/edit
  def edit
  end

  # POST /animal_images
  # POST /animal_images.json
  def create
    @animal_image = AnimalImage.new(animal_image_params)

    respond_to do |format|
      if @animal_image.save
        format.html { redirect_to @animal_image, notice: "Animal image was successfully created." }
        format.json { render :show, status: :created, location: @animal_image }
      else
        format.html { render :new }
        format.json { render json: @animal_image.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /animal_images/1
  # PATCH/PUT /animal_images/1.json
  def update
    respond_to do |format|
      if @animal_image.update(animal_image_params)
        format.html { redirect_to @animal_image, notice: "Animal image was successfully updated." }
        format.json { render :show, status: :ok, location: @animal_image }
      else
        format.html { render :edit }
        format.json { render json: @animal_image.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /animal_images/1
  # DELETE /animal_images/1.json
  def destroy
    @animal_image.destroy
    respond_to do |format|
      format.html
      format.js {}
      format.json { render json: { ok: true } }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_animal_image
    @animal_image = AnimalImage.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def animal_image_params
    params.require(:animal_image).permit(:animal_id, :image, :remove_image)
  end
end

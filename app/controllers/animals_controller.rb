class AnimalsController < ApplicationController
  include ApplicationHelper
  layout :select_layout
  before_action :set_breeds
  before_action :set_animal, only: [:show, :edit, :update, :destroy, :show_employees, :return, :endanger, :save]
  before_filter :custom_user_auth, only: [:edit, :update, :destroy, :show_employees, :create, :new, :list]

  # GET /animals
  # GET /animals.json
  def index
    @animals = Animal.where(status: [0, 1])
  end

  # GET /animals
  # GET /animals.json
  def list
    @animals = Animal.all
    @shelter_animals = Animal.where(status: 0)
    @adopted_animals = Animal.where(status: 2)
    @ff_animals = Animal.where(status: 1)
    render "animals/index_employees"
  end

  def list_dogs
    @animals = Animal.where(animal_type: 1, status: [0, 1])
    @dog_breeds = Breed.where(animal_type: 1)
    render "animals/index_dogs"
  end

  def list_cats
    @animals = Animal.where(animal_type: 2, status: [0, 1])
    @cat_breeds = Breed.where(animal_type: 2)
    render "animals/index_cats"
  end

  # GET /animals/1
  # GET /animals/1.json
  def show
  end

  def show_employees
    render "animals/show_animal_employee"
  end

  # GET /animals/new
  def new
    @animal = Animal.new
  end

  # GET /animals/1/edit
  def edit
  end

  # POST /animals
  # POST /animals.json
  def create
    @animal = Animal.new(animal_params)
    @animal.breed_id = if animal_params[:animal_type] == "1"
                         params[:dog_breed_id]
                       else
                         params[:cat_breed_id]
                       end
    @animal.name.capitalize!
    respond_to do |format|
      if @animal.save
        if params[:animal_images]
          params[:animal_images][:image].each do |img|
            @animal_image = @animal.animal_images.create(image: img, animal: @animal)
          end
        end
        format.html { redirect_to show_animal_employees_path(@animal), notice: "Animal was successfully created." }
        format.json { render :show, status: :created, location: @animal }
      else
        format.html { render :new }
        format.json { render json: @animal.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /animals/1
  # PATCH/PUT /animals/1.json
  def update
    @breed = nil
    @breed = if animal_params[:animal_type] == "1"
               Breed.where(id: params[:dog_breed_id]).first
             else
               Breed.where(id: params[:cat_breed_id]).first
             end
    @animal.breed = @breed
    new_params = animal_params
    new_params[:breed_id] = @breed.id
    respond_to do |format|
      if @animal.update(new_params)
        if params[:animal_images]
          params[:animal_images][:image].each do |img|
            @animal_image = @animal.animal_images.create(image: img)
          end
        end
        format.html { redirect_to show_animal_employees_path(@animal), notice: "Animal was successfully updated." }
        format.json { render :show, status: :ok, location: @animal }
      else
        format.html { render :edit }
        format.json { render json: @animal.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /animals/1
  # DELETE /animals/1.json
  def destroy
    @animal.destroy
    respond_to do |format|
      format.html { redirect_to animals_list_employees_path, notice: "Animal was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  def filter_by_breed(animals, breed_filter)
    if breed_filter != -1
      breed_animals =  Animal.filter_animals_by_breed(breed_filter).to_a
      return elements_in_both(breed_animals, animals)
    else
      return animals
    end
  end

  def filter_by_size(animals, size_filter)
    if size_filter != -1
      size_animals =  Animal.filter_animals_by_size(size_filter).to_a
      return elements_in_both(size_animals, animals)
    else
      return animals
    end
  end

  def filter_by_age(animals, age_filter)
    if age_filter != -1
      age_animals =  Animal.filter_animals_by_age(age_filter).to_a
      return elements_in_both(age_animals, animals)
    else
      return animals
    end
  end

  def set_breeds
    @breeds_cats = Breed.where(animal_type: 2)
    @breeds_dogs = Breed.where(animal_type: 1)
  end

  def filters
    breed_filter = params[:breed_filter].to_i
    size_filter = params[:size_filter].to_i
    age_filter = params[:age_filter].to_i
    type_filter = params[:animal_type_filter].to_i
    type_animals = Animal.filter_animal_by_type(type_filter).to_a
    animals = filter_by_breed(type_animals, breed_filter)
    animals = filter_by_size(animals, size_filter)
    animals = filter_by_age(animals, age_filter)
    final_response = Animal.prepare_response(animals)
    render json: final_response
  end

  def return
    @animal.status = 0
    @animal.save
    redirect_to :animals_list_employees
  end

  def endanger
    @animal.endangered = true
    @animal.save
    redirect_to :animals_list_employees
  end

  def save
    @animal.endangered = false
    @animal.save
    redirect_to :animals_list_employees
  end

  private

  def animal_params
    params.require(:animal).permit(:name, :date_of_birth, :breed_id, :dog_breed_id, :cat_breed_id, :photo, :size, :gender,
      :description, :entry_date, :status, :medical_conditions,
      :animal_type, animal_images_attributes: [:id, :animal_id, :image, :remove_image])
  end

  def set_animal
    @animal = Animal.find(params[:id])
  end

  def select_layout
    case action_name
    when "index", "show", "list_cats", "list_dogs"
      "users"
    else
      "employees"
    end
  end
end

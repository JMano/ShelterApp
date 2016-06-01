class AdoptionsController < ApplicationController
  before_action :set_adoption, only: [:show, :edit, :update, :destroy]
  before_filter :custom_user_auth
  before_action :set_necessary

  def set_necessary
    @users = User.all
    @animals = Animal.where(status: 0)
  end

  # GET /adoptions
  # GET /adoptions.json
  def index
    @adoptions = Adoption.all
    @permanent_adoptions = Adoption.where(adoption_type: 1)
    @temporary_adoptions = Adoption.where(adoption_type: 2)
  end

  # GET /adoptions/1
  # GET /adoptions/1.json
  def show
    @previous_adoptions = Adoption.where(user_id: @adoption.user.id).where.not(id: @adoption.id)
  end

  # GET /adoptions/new
  def new
    @adoption = Adoption.new
    @animals = Animal.where(status: 0)
    @users = User.all
  end

  # GET /adoptions/1/edit
  def edit
    @animals = Animal.where(status: 0)
    @animals_codes = Animal.all
  end

  # POST /adoptions
  # POST /adoptions.json
  def create
    var = 0
    @user = User.new(cc: 111111, name: "lixo", address: "lixo", contact: 1231231)
    @user.id = adoption_params[:user_id]
    if !User.where(cc: params[:user_cc]).any?
      var = 1
      @user = User.create(cc: params[:user_cc], name: params[:user_name], address: params[:user_address], contact: params[:user_contact])
    else
      @user = User.where(cc: params[:user_cc]).first
      @user.update(cc: params[:user_cc], name: params[:user_name], address: params[:user_address], contact: params[:user_contact])
    end
    adoption_params[:user_id] = @user.id
    @adoption = Adoption.new(adoption_params)
    @adoption.user_id = @user.id
    respond_to do |format|
      if @adoption.save
        animal = Animal.find(@adoption.animal_id)
        animal.status = @adoption.adoption_type
        animal.save
        format.html { redirect_to @adoption, notice: "Adoption was successfully created." }
        format.json { render :show, status: :created, location: @adoption }
      else
        if var == 1
          User.destroy(@user.id)
        end
        format.html { render :new }
        format.json { render json: @adoption.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /adoptions/1
  # PATCH/PUT /adoptions/1.json
  def update
    respond_to do |format|
      if @adoption.update(adoption_params)
        animal = Animal.find(@adoption.animal_id)
        animal.status = @adoption.adoption_type
        animal.save
        format.html { redirect_to @adoption, notice: "Adoption was successfully updated." }
        format.json { render :show, status: :ok, location: @adoption }
      else
        format.html { render :edit }
        format.json { render json: @adoption.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /adoptions/1
  # DELETE /adoptions/1.json
  def destroy
    @adoption.destroy
    respond_to do |format|
      format.html { redirect_to adoptions_url, notice: "Adoption was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_adoption
    @adoption = Adoption.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def adoption_params
    params.require(:adoption).permit(:adoption_date, :adoption_type, :end_date, :user_id, :animal_id, :employee_id)
  end
end

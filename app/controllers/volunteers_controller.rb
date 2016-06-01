class VolunteersController < ApplicationController
  before_action :set_users
  before_filter :custom_user_auth
  before_action :set_volunteer, only: [:show, :edit, :update, :destroy, :show_employees]

  def index
    @volunteers = Volunteer.all
  end

  def show
  end

  def new
    @volunteer = Volunteer.new
  end

  def update
    respond_to do |format|
      if @volunteer.update(volunteer_params)
        format.html { redirect_to volunteer_path(@volunteer), notice: "Volunteer was successfully updated." }
        format.json { render :show, status: :ok, location: @volunteer }
      else
        format.html { render :edit }
        format.json { render json: @volunteer.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @volunteer.destroy
    respond_to do |format|
      format.html { redirect_to volunteers_url, notice: "Volunteer was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  def edit
  end

  def create
    @user = User.new(cc: 111111, name: "lixo", address: "lixo", contact: 1231231)
    @user.id = volunteer_params[:user_id]
    @user = if !User.where(cc: params[:user_cc]).any?
              User.create(cc: params[:user_cc], name: params[:user_name], address: params[:user_address], contact: params[:user_contact])
            else
              User.find_by_cc(params[:user_cc])
            end
    real_params = volunteer_params
    real_params[:user_id] = @user.id
    @volunteer = Volunteer.new(real_params)
    @volunteer.user_id = @user.id
    respond_to do |format|
      if @volunteer.save
        format.html { redirect_to @volunteer, notice: "volunteer was successfully created." }
        format.json { render :show, status: :created, location: @volunteer }
      else
        format.html { render :new }
        format.json { render json: @volunteer.errors, status: :unprocessable_entity }
      end
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_volunteer
    @volunteer = Volunteer.find(params[:id])
  end

  def set_users
    ids = Volunteer.all.collect(&:user_id)
    @users = User.where("id NOT IN (?)", ids)
    @volunteer_users = Volunteer.all
  end

  def volunteer_params
    params.require(:volunteer).permit(:employee_id, :user_id)
  end
end

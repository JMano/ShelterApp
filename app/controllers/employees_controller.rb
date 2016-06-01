class EmployeesController < ApplicationController
  layout "employees"
  before_filter :custom_user_auth
  before_filter :custom_admin, only: [:show, :new, :edit, :update, :destroy, :create, :list]
  before_action :set_employee, only: [:show, :edit, :update]

  def index
    @last_month_arrivals = Animal.last_month_arrivals.size
    @total_adoptions = Adoption.all.size
    @total_animals = Animal.all.size
    @total_volunteers = Volunteer.all.size
    @food_donations = Donation.where(donation_type: 2)
    @money_donations = Donation.where(donation_type: 1)
    @number_of_money_donations = @money_donations.size
    @number_of_food_donations = @food_donations.size
    @donations_money_value = 0
    @donations_food_value = 0
    @money_donations.each { |dm| @donations_money_value += dm.quantity }
    @food_donations.each { |df| @donations_food_value += df.quantity }
    @last_arrivals = Animal.order(:entry_date).last(5).reverse
    @last_adoptions = Adoption.where(adoption_type: 1).order(:adoption_date).last(5).reverse
    @others_amount = Donation.where(donation_type: 0).size
  end

  def show
    @adoptions_actions = Adoption.where(employee_id: @employee.id)
    @donations_actions = Donation.where(employee_id: @employee.id)
    @volunteer_register = Volunteer.where(employee_id: @employee.id).size
  end

  def list
    @employees = Employee.all
    render "employees/list"
  end

  def new
    @employee = Employee.new
  end

  def edit
  end

  def create
    @employee = Employee.new(employee_params)
    respond_to do |format|
      if @employee.save
        format.html { redirect_to @employee, notice: "Employee was successfully created." }
        format.json { render :show, status: :created, location: @employee }
      else
        format.html { render :new }
        format.json { render json: @employee.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @employee.update_with_password(employee_params)
        format.html { redirect_to @employee, notice: "Employee was successfully updated." }
        format.json { render :show, status: :ok, location: @employee }
      else
        format.html { render :edit }
        format.json { render json: @employee.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @employee.destroy
    respond_to do |format|
      format.html { redirect_to employees_url, notice: "Employee was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_employee
    @employee = Employee.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def employee_params
    params.require(:employee).permit(:name, :contact, :cc, :email, :admin, :password, :password_confirmation, :current_password)
  end
end

class DonationsController < ApplicationController
  before_action :set_donation, only: [:show, :edit, :update, :destroy]
  before_filter :custom_user_auth
  before_action :set_users

  def set_users
    @users = User.all
  end

  # GET /donations
  # GET /donations.json
  def index
    @donations = Donation.all
    @money_donations = Donation.where(donation_type: 1)
    @food_donations = Donation.where(donation_type: 2)
    @other_donations = Donation.where(donation_type: 0)
  end

  # GET /donations/1
  # GET /donations/1.json
  def show
    @previous_donations = Donation.where(user_id: @donation.user.id).where.not(id: @donation.id)
  end

  # GET /donations/new
  def new
    @donation = Donation.new
    @users = User.all
  end

  # GET /donations/1/edit
  def edit
    @users = User.all
  end

  def destroy
    @donation.destroy
    respond_to do |format|
      format.html { redirect_to donations_url, notice: "Donation was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  def update
    respond_to do |format|
      if @donation.update(donation_params)
        format.html { redirect_to donation_path(@donation), notice: "Donation was successfully updated." }
        format.json { render :show, status: :ok, location: @donation }
      else
        format.html { render :edit }
        format.json { render json: @donation.errors, status: :unprocessable_entity }
      end
    end
  end

  # POST /donations
  # POST /donations.json
  def create
    var = 0
    @user = User.new(cc: 111111, name: "name", address: "address", contact: 1231231)
    @user.id = donation_params[:user_id]
    if !User.where(cc: params[:user_cc]).any?
      var = 1
      @user = User.create(cc: params[:user_cc], name: params[:user_name], address: params[:user_address], contact: params[:user_contact])
    else
      @user = User.where(cc: params[:user_cc]).first
      @user.update(cc: params[:user_cc], name: params[:user_name], address: params[:user_address], contact: params[:user_contact])
    end
    donation_params[:user_id] = @user.id
    @donation = Donation.new(donation_params)
    @donation.user_id = @user.id
    respond_to do |format|
      if @donation.save
        format.html { redirect_to @donation, notice: "Donation was successfully created." }
        format.json { render :show, status: :created, location: @donation }
      else
        if var == 1
          User.destroy(@user.id)
        end
        format.html { render :new }
        format.json { render json: @donation.errors, status: :unprocessable_entity }
      end
    end
  end

  def stats
    labels = %w(Money Food Oxthers)
    series = [Donation.where(donation_type: 1).size, Donation.where(donation_type: 2).size, Donation.where(donation_type: 0).size]
    render json: {
      labels: labels,
      series: series,
    }.to_json
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_donation
    @donation = Donation.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def donation_params
    params.require(:donation).permit(:donation_date, :donation_type, :description, :quantity,
      :user_id, :user_cc, :user_name, :user_address, :user_contact, :employee_id)
  end
end

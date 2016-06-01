class ShelterController < ApplicationController
  before_filter :custom_user_auth

  def show
    @shelter = set_shelter
  end

  def edit
    @shelter = set_shelter
  end

  def update
    @shelter = set_shelter
    respond_to do |format|
      if @shelter.update(shelter_params)
        format.html { redirect_to @shelter, notice: "Shelter was successfully updated." }
        format.json { render :show, status: :ok, location: @shelter }
      else
        format.html { render :edit }
        format.json { render json: @shelter.errors, status: :unprocessable_entity }
      end
    end
  end

  # Use callbacks to share common setup or constraints between actions.
  def set_shelter
    @shelter = Shelter.find(params[:id])
  end

  def shelter_params
    params.require(:shelter).permit(:name, :phone, :email, :opening_date, :description, :schedule, :address, :lat, :lng)
  end
end

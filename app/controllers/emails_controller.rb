class EmailsController < ApplicationController
  layout "users"

  def new
    @email = Email.new
  end

  def create
    @email = Email.new(params[:email])
    @email.request = request
    if @email.deliver
      flash[:success] = "Email sent"
    else
      flash[:error] = "Cannot send message"
    end
    redirect_to controller: "static_pages", action: "contacts"
  end

  def send_email
    ShelterMailer.new_email
  end
end

class RequestsController < ApplicationController
  layout :select_layout
  before_filter :custom_user_auth, only: [:index, :update]

  # GET /requests
  # GET /requests.json
  def index
    @requests = Request.where(status: 0).order(created_at: :desc)
    @requests_status1 = Request.where(status: 1).order(created_at: :desc)
    @request = if !@requests.empty?
                 @requests.first
               else
                 @requests_status1.first
               end
  end

  # GET /requests/1
  # GET /requests/1.json
  def show
  end

  def update_all
    Request.update_all(status: 1)
    redirect_to(:back)
  end

  def update
    @request = set_request
    @request.update_attribute(:status, 1)
    redirect_to(:back)
  end

  # GET /requests/new
  def new
    prev = Rails.application.routes.recognize_path(request.referrer)
    @request = Request.new
    @animal_id = params[:animal_id]
    if prev[:action] == "volunteer"
      @request.subject = "Volunteer Request"
    elsif prev[:action] == "donations"
      @request.subject = "Donation Request"
    elsif prev[:action] == "show"
      @request.subject = "Adoption Request for Animal: #{@animal_id}"
    end
  end

  # GET /requests/1/edit
  def edit
  end

  # POST /requests
  # POST /requests.json
  def create
    @request = Request.new(request_params)

    respond_to do |format|
      if @request.save
        case @request.subject
        when "Volunteer Request"
          flash[:success] = "Volunteer Request sent"
          format.html { redirect_to controller: "static_pages", action: "volunteer" }
        when "Donation Request"
          flash[:success] = "Donation request sent"
          format.html { redirect_to controller: "static_pages", action: "donations" }
        else
          flash[:success] = "Adoption request sent"
          format.html { redirect_to controller: "animals", action: "index" }
        end
        format.json { render :show, status: :created, location: @request }
      else
        format.html { render :new }
        format.json { render json: @request.errors, status: :unprocessable_entity }
      end
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_request
    @request = Request.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def request_params
    params.require(:request).permit(:name, :contact, :subject, :status, :content, :shelter_id)
  end

  def select_layout
    case action_name
    when "show", "create", "new"
      "users"
    else
      "employees"
    end
  end
end

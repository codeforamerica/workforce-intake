class WorkforceApplicationsController < ApplicationController
  before_action :set_workforce_application, only: [:show, :edit, :update, :destroy]

  # GET /workforce_applications
  def index
    @workforce_applications = WorkforceApplication.all
  end

  # GET /workforce_applications/1
  def show
  end

  # GET /workforce_applications/new
  def new
    @workforce_application = WorkforceApplication.new
  end

  # GET /workforce_applications/1/edit
  def edit
  end

  # POST /workforce_applications
  def create
    @workforce_application = WorkforceApplication.new(workforce_application_params)

    if @workforce_application.save
      redirect_to @workforce_application, notice: 'Workforce application was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /workforce_applications/1
  def update
    if @workforce_application.update(workforce_application_params)
      redirect_to @workforce_application, notice: 'Workforce application was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /workforce_applications/1
  def destroy
    @workforce_application.destroy
    redirect_to workforce_applications_url, notice: 'Workforce application was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_workforce_application
      @workforce_application = WorkforceApplication.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def workforce_application_params
      params.require(:workforce_application).permit(:email, :phone_number, :household_size, :earned_income)
    end
end

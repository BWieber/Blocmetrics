class RegisteredApplicationsController < ApplicationController

  def index
    @applications = RegisteredApplication.all
  end

  def show
    @application = RegisteredApplication.find(params[:id])

    @events = @application.events.group_by(&:name)
  end

  def new
    @application = RegisteredApplication.new
  end

  def create
    @application = RegisteredApplication.new(app_params)
    @application.user = current_user

    if @application.save
      flash[:success] = "You application has been registered."
      redirect_to @application
    else
      flash[:error] = "There was an error saving your application. Please try again."
      render :new
    end
  end


  def edit
    @application = RegisteredApplication.find(params[:id])
  end

  def update
    @application = RegisteredApplication.find(params[:id])

    @application.assign_attributes(app_params)

    if @application.save
      flash[:notice] = "You application has been updated."
      redirect_to @application
    else
      flash[:error] = "There was an error updating your application. Please try again."
      render :edit
    end

  end

  def destroy
    @application = RegisteredApplication.find(params[:id])

    if @application.destroy
      flash[:notice] = "Application was successfully deleted."
      redirect_to registered_applications_path
    else
      flash[:error] = "There was an error deleting your application."
      redirect_to :back
    end
  end

  private

  def app_params
    params.require(:registered_application).permit(:name, :url)
  end

end

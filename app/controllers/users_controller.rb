class UsersController < ApplicationController

  def show
    if current_user.present?
      @user = params[:id] ? User.find(params[:id]) : current_user

      @user_applications = @user.registered_applications
      
    else
      redirect_to new_user_registration_path
    end
  end

  def index
    User.all
  end

end

class ApplicationController < ActionController::Base

  before_action :authenticate_user!

  def default_url_options
    {:host => "localhost", :port => "3000"}
  end

  protect_from_forgery with: :exception

end

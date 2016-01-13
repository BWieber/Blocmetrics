class ApplicationController < ActionController::Base

  def default_url_options
    {:host => "localhost", :port => "3000"}
  end

  protect_from_forgery with: :exception

end

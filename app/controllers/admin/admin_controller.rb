# Filters added to this controller apply to all controllers in the application.
# Likewise, all the methods added will be available for all controllers.

class Admin::AdminController < ApplicationController
  
  #layout 'admin'
  
  before_filter :require_user
  before_filter :require_admin
  
  # Scrub sensitive parameters from your log
  # filter_parameter_logging :password
  
  def require_user
    unless current_user
      store_location
      flash[:error] = "You need to log in before you can access this page."
      redirect_to new_user_session_path
      return false
    end
  end
  
  def require_admin
    unless current_user.is_admin
      flash[:error] = "You must be logged in as an admin to access this page"
      redirect_to root_path
    end
  end
  
  def store_location
    session[:return_to] = request.request_uri
  end
end

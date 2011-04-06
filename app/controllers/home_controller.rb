class HomeController < ApplicationController
   before_filter :authenticate_user!, :except => [:index]
  
  def index
    
  end

  def return_to_admin
    @user_admin = User.find(session["admin_user_id"])
    if(@user_admin)
      sign_in(:user, @user_admin)
      #current_user = @user_admin
      session["admin_user_id"] = nil
      redirect_to admin_users_path and return
    end
    redirect_to root_path
  end
end
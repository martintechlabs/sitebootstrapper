class Admin::UsersController < Admin::AdminController
  
  def index
    @is_admin_users = true
    if params[:user_id] && params[:user_id].to_i > 0
      @users = User.all(:conditions => ['id = ?', params[:user_id]]).paginate(:page => params[:page], :per_page => 50)
    else
      @users = User.all(:order => 'first_name, last_name').paginate(:page => params[:page], :per_page => 50)
    end
  end
  
  def resend_activation
    user = User.find(params[:id])
    user.send_confirmation_instructions
    #user.save
    render :json => {:status => 1, :user_name => user.full_name}
  end
  
  def login_as
    @new_user = User.find(params[:id])
    session["admin_user_id"] = current_user.id
    sign_in(:user, @new_user)
    #current_user = @new_user
    redirect_to root_path
  end
  
  def make_admin
    user = User.find(params[:id])
    user.update_attribute(:is_admin, true)
    flash[:ok] = "User #{user.email} is now admin"
    redirect_to admin_users_path
  end
  
  def destroy
    user = User.find(params[:id])
    user.destroy
    flash[:ok] = "User #{user.email} deleted"
    redirect_to admin_users_path
  end
  
  def to_csv
    @users = User.find(:all, :order => 'last_name, first_name')
    csv_string = ""
    csv_string << "Name, Email, Create at, Status, Last login, Role\r\n"
    @users.each do |user|
      csv_string << "#{user.full_name}, #{user.email}, #{user.created_at.strftime("%Y-%m-%d %H:%M")}, #{user.status}, #{(user.last_sign_in_at ? user.last_sign_in_at.strftime("%Y-%m-%d %H:%M"):"never")}, #{(user.is_admin? ? 'Admin' :'')}\r\n"
    end
    send_data csv_string, :type => "text/csv; charset=utf-8; header=present", :filename => "user_accounts_#{Time.now.strftime("%m-%d-%Y")}.csv", :disposition => 'attachment'
  end
  
end
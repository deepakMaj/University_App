class ApplicationController < ActionController::Base

  helper_method :user_admin, :logged_admin?

  def user_admin
    @admin_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  def logged_admin?
    !!user_admin
  end

  def require_admin
    if !logged_admin?
      flash[:notice] = "Only admin can perform those actions"
    end
  end

end

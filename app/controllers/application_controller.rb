class ApplicationController < ActionController::Base

  helper_method :user_admin, :logged_admin?, :current_student, :logged_in?

  def user_admin
    @admin_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  def logged_admin?
    !!user_admin
  end

  def require_admin
    if !logged_admin? || !user_admin.admin?
      flash[:notice] = "Only admin can perform those actions"
      redirect_to root_path
    end
  end

  def current_student
    @current_student ||= Student.find(session[:student_id]) if session[:student_id]
  end

  def logged_in?
    !!current_student
  end

  def require_student
    if !logged_in?
      flash[:danger] = "You must be logged in to perform this action"
      redirect_to students_path
    end
  end

end

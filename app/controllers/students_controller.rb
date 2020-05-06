class StudentsController < ApplicationController

  before_action :set_action, only: [:edit, :update, :show]
  before_action :require_student, except: [:new, :create, :index]
  before_action :only_student, only: [:edit]

  def index
    @students = Student.all
  end

  def new
    @student = Student.new
  end

  def create
    @student = Student.new(student_params)
    if @student.save
      flash[:notice] = "Welcome to the Tech University #{@student.name}"
      redirect_to loginstudent_path
    else
      render 'new'
    end
  end

  def edit
  end

  def update
    if @student.update(student_params)
      flash[:notice] = "Your account was updated successfully"
      redirect_to student_path(@student)
    else
      render 'edit'
    end
  end

  def show
  end


  private
    def student_params
      params.require(:student).permit(:name, :email, :password)
    end

    def set_action
      @student = Student.find(params[:id])
    end

    def only_student
      if logged_in? && current_student != @student
        flash[:danger] = "You can edit only your profile"
        redirect_to student_path(current_student)
      end
    end

end

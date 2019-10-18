class CoursesController < ApplicationController

  before_action :set_course, only: [:edit, :update, :destroy]
  before_action :require_admin, except: [:index, :about]

  def index
    @courses = Course.all
  end

  def new
    @course = Course.new
  end

  def create
    @course = Course.new(course_params)
    @course.user = user_admin
    if @course.save
      flash[:notice] = "Course was successfully created"
      redirect_to root_path
    else
      render 'new'
    end

  end

  def edit
  end

  def update
    if @course.update(course_params)
      flash[:notice] = "Course was successfully updated"
      redirect_to root_path
    else
      render 'edit'
    end

  end

  def destroy
    @course.destroy
    flash[:notice] = "Course was successfully deleted"
    redirect_to root_path
  end

  def about
  end

  private

    def course_params
      params.require(:course).permit(:name, :description)
    end

    def set_course
      @course = Course.find(params[:id])
    end

end

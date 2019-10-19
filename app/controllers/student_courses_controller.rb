class StudentCoursesController < ApplicationController

  def create
    course_to_add = Course.find(params[:course_id])
    if current_student.courses.include?(course_to_add)
      flash[:danger] = "You have already been enrolled with this course"
      redirect_to root_path
    else
      if current_student.courses.count == 3
        flash[:danger] = "You can enroll only for 3 courses"
        redirect_to root_path
      else
        StudentCourse.create(course: course_to_add, student: current_student)
        flash[:success] = "You have successfully enrolled in #{course_to_add.name}"
        redirect_to current_student
      end
    end
  end

  def show
    if logged_in? && current_student.courses.include?(Course.find(params[:course_id]))
      @course_to_view = Course.find(params[:course_id])
    else
      flash[:danger] = "You can only view enrolled courses"
      redirect_to root_path
    end
  end

end

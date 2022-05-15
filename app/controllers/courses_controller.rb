class CoursesController < ApplicationController
  before_action :set_course, only: %i[ show edit update destroy ]

  # GET /courses
  def index
    @courses = Course.all
  end

  # GET /courses/1
  def show
  end

  # GET /courses/new
  def new
    @course = Course.new
  end

  # GET /courses/1/edit
  def edit
  end

  # POST /courses
  def create
    @course = Course.new(course_params)

    if @course.save
      flash[:success] = "true"
      flash[:message] = "Successfully created a course."
      redirect_to @course
    else
      flash[:success] = "false"
      flash[:message] = "An error occured while creating a course. Please try again."
      flash[:errors] = @course.errors
      redirect_to new_course_path
    end
  end

  # PATCH/PUT /courses/1
  def update
    if @course.update(course_params)
      flash[:success] = "true"
      flash[:message] = "Successfully edited the course."
      redirect_to @course
    else
      flash[:success] = "false"
      flash[:message] = "An error occured while editing the course. Please try again."
      flash[:errors] = @course.errors
      redirect_to edit_course_path
    end
  end

  # DELETE /courses/1
  def destroy
    flash[:message] = "Course has been deleted."
    @course.destroy
    redirect_to courses_url
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_course
      @course = Course.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def course_params
      params.require(:course).permit(:code, :name)
    end
end

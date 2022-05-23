class CoursesController < ApplicationController

  before_action :logged_in?
  before_action :activated?

  before_action :set_course, only: %i[ show edit update destroy ]
  before_action :get_posts, only: %i[ show ]

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
      redirect_to courses_path
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
      redirect_back(fallback_location: courses_path)
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

    def get_posts
      @posts = @course.posts
    end

    # Only allow a list of trusted parameters through.
    def course_params
      params.require(:course).permit(:code, :name)
    end
end

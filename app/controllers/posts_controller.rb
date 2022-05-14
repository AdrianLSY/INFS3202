class PostsController < ApplicationController
  before_action :get_course
  before_action :set_post, only: %i[show edit update destroy]

  def index
    @posts = @course.posts
  end

  def show
  end

  def new
    @post = @course.posts.build
  end

  def edit
  end

  def create
    @post = @course.posts.build(post_params)
    @post.user = current_user

    if @post.save
      redirect_to course_posts_path, notice: "Post was successfully created."
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
    if @post.update(post_params)
      redirect_to course_posts_path, notice: "Post was successfully updated."
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @post.destroy
    redirect_to course_posts_path, notice: "Post was successfully destroyed."
  end

  private
    def set_post
      @post = @course.posts.find(params[:id])
    end

    def post_params
      params.require(:post).permit(:title, :body)
    end

    def get_course
      @course = Course.find(params[:course_id])
    end
end

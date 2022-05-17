class CommentsController < ApplicationController
  before_action :get_course
  before_action :get_post
  before_action :set_comment, only: %i[ show edit update destroy ]

  # GET /comments
  def index
    @comments = @post.comments
  end

  # GET /comments/1
  def show
  end

  # GET /comments/new
  def new
    @comment = Comment.new
  end

  # GET /comments/1/edit
  def edit
  end

  # POST /comments
  def create
    @comment = @post.comments.build(comment_params)
    @comment.user = current_user
    @comment.post = @post
    if @comment.save
      flash[:success] = "true"
      flash[:message] = "Successfully left a comment."
      redirect_to course_post_path(@course, @post)
    else
      flash[:success] = "false"
      flash[:message] = "An error occured while leaving a comment. Please try again."
      flash[:errors] = @comment.errors
      redirect_to edit_course_post_comment_path
    end
  end

  # PATCH/PUT /comments/1
  def update
    params[:comment][:parent_id] = @comment.parent_id
    if @comment.update(comment_params)
      flash[:success] = "true"
      flash[:message] = "Successfully updated the comment"
      redirect_to course_post_path(@course, @post)
    else
      flash[:success] = "false"
      flash[:message] = "An error occured while updating a comment. Please try again."
      redirect_to edit_course_post_comment_path
    end
  end

  # DELETE /comments/1
  def destroy
    flash[:message] = "Comment has been deleted."
    @comment.destroy
    redirect_to course_post_path(@course, @post)
  end

  def award
    @comment.user.collect_award(current_user, nil, @comment)
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_comment
      @comment = Comment.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def comment_params
      params.require(:comment).permit(:body, :parent_id)
    end

    def get_course
      @course = Course.find(params[:course_id])
    end

    def get_post
      @post = Post.find(params[:post_id])
    end

end

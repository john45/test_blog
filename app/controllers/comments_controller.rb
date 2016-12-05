class CommentsController < ApplicationController
  before_action :find_post
  before_action :find_comment, only: [:destroy, :edit, :update]

  def new
    @comment = Comment.new(parent_id: params[:parent_id])
    respond_to do |format|
      format.js { render 'new', status: :created, location: @post}
      # format.html
    end
  end

  def create
    @comment = @post.comments.create(comment_params)
    @comment.user_id = current_user.id
    respond_to do |format|
      if @comment.save
        format.js { render 'create', status: :created, location: @post }
        format.html { redirect_to @post}
        # redirect_to posts_path
      else
        render 'new'
      end
    end

  end

  def edit
  end

  def update
    if @comment.update(comment_params)
      redirect_to @post
    else
      render 'edit'
    end

  end

  def destroy
    @comment.destroy
    redirect_to '/'
  end

  private

    def find_post
      @post = Post.find(params[:post_id])
    end

    def find_comment
      @comment = @post.comments.find(params[:id])
    end

    def comment_params
      params.require(:comment).permit(:body,:parent_id)
    end
end

class PostsController < ApplicationController
  before_action :require_login
  before_action :set_post, only: [:show, :edit, :update, :destroy]

  # GET /posts
  # GET /posts.json
  def index
    @posts = Post.all
    @user = current_user
    # def_respond_to(@posts)
  end

  # GET /posts/1
  # GET /posts/1.json
  def show
    @comments = Comment.where(post_id: @post).order('created_at DESC')
  end

  # GET /posts/new
  def new
    @post = current_user.posts.build
  end

  # GET /posts/1/edit
  def edit
  end

  # POST /posts
  # POST /posts.json
  def create
    @post = current_user.posts.build(post_params)

    respond_to do |format|
      if @post.save
        format.html do
          redirect_to posts_url, notice: 'Post was successfully created.'
        end
        format.json { render :index, status: :created, location: @post }
        format.js { render 'create', status: :created, location: @post }
      else
        format.html { render :new }
        format.json { render json: @post.errors, status: :unprocessable_entity }
        format.js { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /posts/1
  # PATCH/PUT /posts/1.json
  def update
    respond_to do |format|
      if @post.update(post_params)
        format.html do
          redirect_to @post, notice: 'Post was successfully updated.'
        end
        format.json { render :show, status: :ok, location: @post }
      else
        format.html { render :edit }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /posts/1
  # DELETE /posts/1.json
  def destroy
    @post.destroy
    respond_to do |format|
      format.html do
        redirect_to posts_url, notice: 'Post was successfully destroyed.'
      end
      format.json { head :no_content }
    end
  end

  private

    def require_login
      redirect_to home_url unless logged_in?
    end

    # def def_respond_to(post)
    #   respond_to do |format|
    #     format.json {
    #       render json: post, except: :updated_at
    #     }
    #     format.html
    #   end
    # end
    # Use callbacks to share common setup or constraints between actions.
    def set_post
      @post = Post.find(params[:id])
    end

    # Never trust parameters from the scary internet,
    # only allow the white list through.
    def post_params
      params.require(:post).permit(:title, :body, :image)
    end
end

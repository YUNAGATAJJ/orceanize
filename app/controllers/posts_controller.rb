class PostsController < ApplicationController
  before_action :set_post, only: %i[ show edit update destroy ]

  def index
    @posts = Post.all
  end

  def show
    @post = Post.find(params[:id])
  end

  def new
    @post = Post.new
  end

  def edit
    @post = current_user.posts.find(params[:id])
  end

  def create
    # @post = Post.new(post_params)
    @post = current_user.posts.build(post_params)

      if @post.save
        redirect_to post_url(@post), success: "Post was successfully created."
      else
        render :new, status: :unprocessable_entity
      end
  end

  def update
    @post = current_user.posts.find(params[:id])
      if @post.update(post_params)
        redirect_to post_url(@post), success: "Post was successfully updated."
      else
        render :edit, status: :unprocessable_entity
      end
  end

  def destroy
    post = current_user.posts.find(params[:id])
    post.destroy!
    redirect_to posts_url, success: "Post was successfully destroyed."

  end

  private
    def set_post
      @post = Post.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def post_params
      params.require(:post).permit(:title, :description, :image)
    end
end

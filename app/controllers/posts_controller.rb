class PostsController < ApplicationController
  before_action :set_post, only: %i[ show edit update destroy ]

  def index
    if params[:tag_name].present?
      tag_name = params[:tag_name]
      @posts = Post.with_tag(tag_name)
    else
      @posts = Post.all
    end
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
    mtags = params[:post][:tag_ids].reject(&:blank?)
    @post = current_user.posts.build(post_params)

      if @post.save
        if mtags
          mtags.each do |mt|
            post_tag = Tag.find(mt)
            @post.tags << post_tag
          end
        end

        redirect_to post_url(@post), success: "Post was successfully created."
      else
        render :new, status: :unprocessable_entity
      end
  end

  def update
    @post = current_user.posts.find(params[:id])
      if @post.update(post_params)
        mtags = params[:post][:tag_ids].reject(&:blank?)
        @post.tags.destroy_all if @post.tags
        if mtags
          mtags.each do |mt|
            post_tag = Tag.find(mt)
            @post.tags << post_tag
          end
        end
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

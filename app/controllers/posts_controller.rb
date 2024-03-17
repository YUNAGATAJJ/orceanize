# frozen_string_literal: true

# seachアクションで、アートコンプリートの対象を、Sealivingモデルのname属性への検索結果が存在した時のみに限定する
class PostsController < ApplicationController
  include CloudinarySettings
  before_action :set_post, only: %i[show edit update destroy]
  skip_before_action :require_login, only: %i[index show search]

  def bookmarks
    @bookmark_boards = current_user.bookmark_posts.includes(:user).order(created_at: :desc)
  end

  def index
    @q = Post.ransack(params[:q])
    filter_post_by_tag
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
    @post = current_user.posts.build(post_params)
    if @post.save
      handle_image_upload if params[:post][:image]
      redirect_to post_url(@post), success: '作品を登録しました'
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
    @post = current_user.posts.find(params[:id])
    if @post.update(post_params)
      update_tags
      redirect_to post_url(@post), success: '作品を更新しました'
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    post = current_user.posts.find(params[:id])
    post.destroy!
    redirect_to posts_url, success: '作品を削除しました'
  end

  def search
    query = params[:q].tr('ぁ-ん', 'ァ-ン')
    @sealivings = Sealiving.where('name LIKE ?', "%#{query}%")
    @filtered_sealivings = @sealivings.select do |sealiving|
      Post.ransack(title_or_description_cont: sealiving.name).result.exists?
    end

    respond_to do |format|
      format.js
    end
  end

  private

  def set_post
    @post = Post.find(params[:id])
  end

  def post_params
    params.require(:post).permit(:title, :description, :image, :image_cache)
  end

  def filter_post_by_tag
    if params[:tag_name].present?
      post_with_tag
    else
      @posts = @q.result(distinct: true).order(created_at: :desc).page(params[:page])
    end
  end

  def post_with_tag
    tag_name = params[:tag_name]
    @posts = Post.with_tag(tag_name).ransack(params[:q]).result(distinct: true).page(params[:page])
  end

  def set_tags
    mtags = params[:post][:tag_ids].compact_blank
    mtags&.each do |mt|
      post_tag = Tag.find(mt)
      @post.tags << post_tag
    end
  end

  def update_tags
    mtags = params[:post][:tag_ids].compact_blank
    @post.tags&.destroy_all
    mtags&.each do |mt|
      post_tag = Tag.find(mt)
      @post.tags << post_tag
    end
  end
end

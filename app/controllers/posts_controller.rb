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

      if @post.save && params[:post][:image]
        # Cloudinaryでファイルをアップロードおよび加工する処理
        uploaded_image = Cloudinary::Uploader.upload(params[:post][:image].tempfile.path,
          transformation: [
            {
              overlay: "stoppollusion_lip5fa", # cloudinaryにアップロードしている画像のPublicIDを指定
              gravity: "south_east", # 位置
              width: 200, # 幅を指定（任意）
              height: 200, # 高さを指定（任意）
              y: 15, # 位置の微調整（任意）
              x: 15 # 位置の微調整（任意）
            }
          ]
        )

        # アップロードしたファイルのURLを取得
        cloudinary_url = uploaded_image["url"]

        # ArticleモデルにURLを保存
        @post.remote_image_url = cloudinary_url

        # CarrierWaveのアップローダーオブジェクトを保存
        @post.save

        if mtags
          mtags.each do |mt|
            post_tag = Tag.find(mt)
            @post.tags << post_tag
          end
        end

        redirect_to post_url(@post), success: "作品を登録しました。"
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
        redirect_to post_url(@post), success: "作品を更新しました。."
      else
        render :edit, status: :unprocessable_entity
      end
  end

  def destroy
    post = current_user.posts.find(params[:id])
    post.destroy!
    redirect_to posts_url, success: "作品を削除しました。."

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

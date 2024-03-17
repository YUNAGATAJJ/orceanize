# frozen_string_literal: true

# cloudinary設定用のモジュール
module CloudinarySettings
  def handle_image_upload
    uploaded_image = upload_postimage_to_cloudinary
    update_post_image(uploaded_image['url']) if uploaded_image
    set_tags
  end

  def upload_postimage_to_cloudinary
    Cloudinary::Uploader.upload(params[:post][:image].tempfile.path, transform_settings)
  end

  def upload_avatarimage_to_cloudinary
    uploaded_image = Cloudinary::Uploader.upload(params[:user][:avatar].tempfile.path)
    cloudinary_url = uploaded_image['url']
    @user.remote_avatar_url = cloudinary_url
    @user.save
  end

  def transform_settings
    {
      transformation: [
        {
          overlay: 'logo_tv2rnu',
          gravity: 'south_east',
          width: 200,
          height: 200,
          y: 15,
          x: 15
        }
      ]
    }
  end

  def update_post_image(cloudinary_url)
    @post.update(remote_image_url: cloudinary_url)
  end
end

class ProfilesController < ApplicationController
  before_action :set_user, only: %i[edit update]
  skip_before_action :require_login

  def show; end

  def edit; end

  # def update
  #   if @user.update(profile_params)
  #     redirect_to profile_path, success: "ユーザ情報が更新されました"
  #   else
  #     render :edit, status: :unprocessable_entity
  #   end
  # end
  def update
    if @user.update(profile_params)
      if params[:user][:avatar]
        uploaded_image = Cloudinary::Uploader.upload(params[:user][:avatar].tempfile.path)
        cloudinary_url = uploaded_image["url"]

        @user.remote_avatar_url = cloudinary_url
        @user.save # ここでモデルを保存
      end
      redirect_to profile_path, success: "ユーザ情報が更新されました"
    else
      render :edit, status: :unprocessable_entity
    end
  end

  private

  def set_user
    @user = User.find(current_user.id)
  end

  def profile_params
    params.require(:user).permit(:nickname, :email, :avatar, :avatar_cache)
  end
end

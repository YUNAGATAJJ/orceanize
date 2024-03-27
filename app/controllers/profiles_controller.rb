# frozen_string_literal: true

# プロフィール管理用
class ProfilesController < ApplicationController
  include CloudinarySettings
  before_action :set_user, only: %i[edit update]
  skip_before_action :require_login

  def show; end

  def edit; end

  def update
    if @user.update(profile_params) && params[:user][:avatar]
      upload_avatarimage_to_cloudinary
      redirect_to profile_path, success: 'ユーザ情報が更新されました'
    elsif @user.update(profile_params)
      redirect_to profile_path, success: 'ユーザ情報が更新されました'
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

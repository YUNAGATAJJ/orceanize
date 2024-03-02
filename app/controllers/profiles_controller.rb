class ProfilesController < ApplicationController
  before_action :set_user, only: %i[edit update]
  skip_before_action :require_login

  def show; end

  def edit; end

  def update
    if @user.update(profile_params)
      redirect_to profile_path, success: "ユーザ情報が更新されました"
    else
      # flash.now['danger'] = 'ユーザ情報を更新できませんでした'
      render :edit, status: :unprocessable_entity
    end
  end

  private

  def set_user
    @user = User.find(current_user.id)
  end

  def profile_params
    params.require(:user).permit(:nickname, :email)
  end
end

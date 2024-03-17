# frozen_string_literal: true

# ログイン・ログアウト用
class UserSessionsController < ApplicationController
  skip_before_action :require_login, only: %i[new create]
  def new; end

  def create
    @user = login(params[:email], params[:password])

    if @user
      redirect_to posts_path
    else
      flash.now[:danger] = 'ログインできませんでした'
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    logout
    redirect_to root_path, status: :see_other, success: 'ログアウトしました'
  end
end

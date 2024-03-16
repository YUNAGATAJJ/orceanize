# 静的ページ表示用
class StaticPagesController < ApplicationController
  skip_before_action :require_login

  def top; end
  def about_orceanize; end
  def privacy_policy; end
  def terms_of_use; end
  def external_link; end
end

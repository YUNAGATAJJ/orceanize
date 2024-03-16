# sorceryのrequire_loginをデフォルトで有効
class ApplicationController < ActionController::Base
  before_action :require_login
  add_flash_types :success, :danger
end

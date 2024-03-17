# frozen_string_literal: true

# ポストの作成者か判別するown?メソッドと、ブックマークしているか判別するbookmark?メソッドを持つ
class User < ApplicationRecord
  authenticates_with_sorcery!
  mount_uploader :avatar, AvatarUploader

  validates :password, length: { minimum: 3 }, if: -> { new_record? || changes[:crypted_password] }
  validates :password, confirmation: true, if: -> { new_record? || changes[:crypted_password] }
  validates :password_confirmation, presence: true, if: -> { new_record? || changes[:crypted_password] }
  validates :nickname, presence: true, length: { maximum: 255 }
  validates :email, presence: true, uniqueness: true

  has_many :posts, dependent: :destroy
  has_many :bookmarks, dependent: :destroy
  has_many :bookmark_posts, through: :bookmarks, source: :post

  def own?(object)
    object&.user_id == id
  end

  def bookmark?(post)
    bookmark_posts.include?(post)
  end
end

# frozen_string_literal: true

# 1ユーザにつき、1つのポストのみマイリスト化できるようバリデーション設定
class Bookmark < ApplicationRecord
  belongs_to :user
  belongs_to :post

  validates :user_id, uniqueness: { scope: :post_id }
end

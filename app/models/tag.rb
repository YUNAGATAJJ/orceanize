# frozen_string_literal: true

# 中間テーブルpost_tagsを経由しpostsと繋がっている
class Tag < ApplicationRecord
  validates :name, presence: true
  has_many :post_tags, dependent: :destroy
  has_many :posts, through: :post_tags
end

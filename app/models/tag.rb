# 中間テーブルpost_tagsを経由しpostsと繋がっている
class Tag < ApplicationRecord
  has_many :post_tags, dependent: :destroy
  has_many :posts, through: :post_tags
end

# 1ポストにつき、1種のタグづつ登録できるようバリデーション設定
class PostTag < ApplicationRecord
  belongs_to :post
  belongs_to :tag

  validates :post_id, uniqueness: { scope: :tag_id }
end

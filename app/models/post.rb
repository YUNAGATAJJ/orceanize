# タグによる絞り込み機能の追加
class Post < ApplicationRecord
  mount_uploader :image, PostImageUploader
  belongs_to :user
  has_many :post_tags, dependent: :destroy
  has_many :tags, through: :post_tags
  has_many :bookmarks, dependent: :destroy
  validates :title, presence: true, length: { maximum: 25 }
  validates :description, presence: true, length: { maximum: 124 }
  validates :image, presence: true

  scope :with_tag, ->(tag_name) { joins(:tags).where(tags: { name: tag_name }) }

  def self.ransackable_associations(_auth_object = nil)
    %w[post_tags tags]
  end

  def self.ransackable_attributes(_auth_object = nil)
    %w[title description]
  end
end

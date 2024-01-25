class Post < ApplicationRecord
  mount_uploader :image, PostImageUploader
  has_many :post_tags, dependent: :destroy
  has_many :tags, through: :post_tags
  validates :title, presence: true
  validates :description, presence: true
  validates :image, presence: true

  scope :with_tag, ->(tag_name) { joins(:tags).where(tags: { name: tag_name }) }
end

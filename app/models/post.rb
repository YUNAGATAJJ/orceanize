class Post < ApplicationRecord
  mount_uploader :image, PostImageUploader
  has_many :post_tags, dependent: :destroy
  has_many :tags, through: :post_tags

  scope :with_tag, ->(tag_name) { joins(:tags).where(tags: { name: tag_name }) }
end

# frozen_string_literal: true

# postTagsテーブルにindexを作成
class AddUniqueIndexToPostTags < ActiveRecord::Migration[7.1]
  def change
    add_index :post_tags, %i[post_id tag_id], unique: true
  end
end

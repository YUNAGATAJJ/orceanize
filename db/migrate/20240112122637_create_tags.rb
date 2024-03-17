# frozen_string_literal: true

# tagsテーブル作成
class CreateTags < ActiveRecord::Migration[7.1]
  def change
    create_table :tags do |t|
      t.string :name
      t.timestamps
    end
  end
end

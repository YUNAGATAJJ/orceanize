# frozen_string_literal: true

# Sealivingsのnameカラムにnull falseを設定
class AddNullFalseToTagsName < ActiveRecord::Migration[7.1]
  def up
    change_column :tags, :name, :string, null: false
  end

  def down
    change_column :tags, :name, :string, null: true
  end
end

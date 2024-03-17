# frozen_string_literal: true

# usersテーブルにavatarカラムを追加
class AddAvatarToUsers < ActiveRecord::Migration[7.1]
  def change
    add_column :users, :avatar, :string
  end
end

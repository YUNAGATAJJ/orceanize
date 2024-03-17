# frozen_string_literal: true

# sealivingsテーブル作成
class CreateSealivings < ActiveRecord::Migration[7.1]
  def change
    create_table :sealivings do |t|
      t.string :name

      t.timestamps
    end
  end
end

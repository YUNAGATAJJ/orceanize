# frozen_string_literal: true

# Sealivingsのnameカラムにnull falseを設定
class AddNullFalseToSealivingsName < ActiveRecord::Migration[7.1]
  def up
    change_column :sealivings, :name, :string, null: false
  end

  def down
    change_column :sealivings, :name, :string, null: true
  end
end

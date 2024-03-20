# frozen_string_literal: true

# 海の生き物をひたすら突っ込むモデル
class Sealiving < ApplicationRecord
  validates :name, presence: true
end

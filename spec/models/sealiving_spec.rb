require 'rails_helper'

RSpec.describe Sealiving, type: :model do
  it '設定したすべてのバリデーションが機能しているか' do
    sealiving = build(:sealiving)
    expect(sealiving).to be_valid
    expect(sealiving.errors).to be_empty
  end

  it 'nameがない場合に、validationが発動してinvalidになるか' do
    sealiving_without_name = build(:sealiving, name: nil)
    expect(sealiving_without_name).to be_invalid
    expect(sealiving_without_name.errors[:name]).to eq ["can't be blank"]
  end
end

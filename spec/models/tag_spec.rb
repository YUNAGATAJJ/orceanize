require 'rails_helper'

RSpec.describe Tag, type: :model do
  it '設定したすべてのバリデーションが機能しているか' do
    tag = build(:tag)
    expect(tag).to be_valid
    expect(tag.errors).to be_empty
  end

  it 'nameがない場合に、validationが発動してinvalidになるか' do
    tag_without_name = build(:tag, name: nil)
    expect(tag_without_name).to be_invalid
    expect(tag_without_name.errors[:name]).to eq ["can't be blank"]
  end
end

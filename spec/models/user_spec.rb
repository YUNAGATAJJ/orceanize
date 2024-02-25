require 'rails_helper'

RSpec.describe User, type: :model do
  it '設定したすべてのバリデーションが機能しているか' do
    user = build(:user)
    expect(user).to be_valid
    expect(user.errors).to be_empty
  end

  it 'nicknameがない場合に、validationが発動してinvalidになるか' do
    user_without_nickname = build(:user, nickname: "")
    expect(user_without_nickname).to be_invalid
    expect(user_without_nickname.errors[:nickname]).to eq ["can't be blank"]
  end

  it 'passwordが2文字以下の場合に、validationが発動してinvalidになるか' do
    user_short_password = build(:user, password: "pa")
    expect(user_short_password).to be_invalid
    expect(user_short_password.errors[:password]).to eq ["is too short (minimum is 3 characters)"]
  end

  it 'password_confirmationがない場合に、validationが発動してinvalidになるか' do
    user_without_password_confirmation = build(:user, password_confirmation: "")
    expect(user_without_password_confirmation).to be_invalid
    expect(user_without_password_confirmation.errors[:password_confirmation]).to eq ["doesn't match Password", "can't be blank"]
  end

  it 'emailが被った場合にuniqueのバリデーションが機能してinvalidになるか' do
    user = create(:user)
    user_with_duplicated_email = build(:user, email: user.email)
    expect(user_with_duplicated_email).to be_invalid
    expect(user_with_duplicated_email.errors[:email]).to eq ["has already been taken"]
  end

  it 'emailが被らない場合にvalidになるか' do
    user = create(:user)
    user_with_another_email = build(:user, email: 'another_email')
    expect(user_with_another_email).to be_valid
    expect(user_with_another_email.errors[:email]).to be_empty
  end
end

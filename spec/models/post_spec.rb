require 'rails_helper'

RSpec.describe Post, type: :model do
  describe 'バリデーションチェック' do
    #user作成
    before do
      @user = create(:user)
    end

    it '設定したすべてのバリデーションが機能しているか' do
      post = build(:post, user_id: @user.id)
      expect(post).to be_valid
    end

    it 'titleがない場合にバリデーションが機能してinvalidになるか' do
      post = build(:post, user_id: @user.id, title: nil)
      post.valid?
      expect(post.errors[:title]).to eq ["can't be blank"]
    end

    it 'descriptionがない場合にバリデーションが機能してinvalidになるか' do
      post = build(:post, user_id: @user.id, description: nil)
      post.valid?
      expect(post.errors[:description]).to eq ["can't be blank"]
    end

    it 'imageがない場合にバリデーションが機能してinvalidになるか' do
      post = build(:post, user_id: @user.id,  image: nil)
      post.valid?
      expect(post.errors[:image]).to eq ["can't be blank"]
    end

    it 'titleが26文字以上の場合にバリデーションが機能してinvalidになるか' do
      post = build(:post, user_id: @user.id,  title: 'a' * 26)
      post.valid?
      expect(post.errors[:title]).to eq ['is too long (maximum is 25 characters)']
    end

    it 'descriptionが125文字以上の場合にバリデーションが機能してinvalidになるか' do
      post = build(:post, user_id: @user.id,  description: 'a' * 125)
      post.valid?
      expect(post.errors[:description]).to eq ['is too long (maximum is 124 characters)']
    end
  end
end

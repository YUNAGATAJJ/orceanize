require 'rails_helper'

RSpec.describe Post, type: :model do
  # Postインスタンスの有効性をテスト
  describe 'バリデーションチェック' do
    it '設定したすべてのバリデーションが機能しているか' do
      post = build(:post)
      expect(post).to be_valid
    end

    it 'titleがない場合にバリデーションが機能してinvalidになるか' do
      post = build(:post, title: nil)
      post.valid?
      expect(post.errors[:title]).to eq ["can't be blank"]
    end

    it 'descriptionがない場合にバリデーションが機能してinvalidになるか' do
      post = build(:post, description: '')
      post.valid?
      expect(post.errors[:description]).to eq ["can't be blank"]
    end

    it 'imageがない場合にバリデーションが機能してinvalidになるか' do
      post = build(:post, image: nil)
      post.valid?
      expect(post.errors[:image]).to eq ["can't be blank"]
    end

    it 'titleが26文字以上の場合にバリデーションが機能してinvalidになるか' do
      post = build(:post, title: 'a' * 26)
      post.valid?
      expect(post.errors[:title]).to eq ['is too long (maximum is 25 characters)']
    end

    it 'descriptionが125文字以上の場合にバリデーションが機能してinvalidになるか' do
      post = build(:post, description: 'a' * 125)
      post.valid?
      expect(post.errors[:description]).to eq ['is too long (maximum is 124 characters)']
    end
  end

  # describe 'associations' do
  #   it 'can have many tags through post_tags' do
  #     post = create(:post)
  #     tag1 = create(:tag)
  #     tag2 = create(:tag)
  #     post.tags << [tag1, tag2]

  #     expect(post.tags.length).to eq(2)
  #   end
  # end
end

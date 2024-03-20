require 'rails_helper'

RSpec.describe Bookmark, type: :model do
  describe 'バリデーションチェック' do
    before do
      @user = create(:user)
      @post = create(:post, user_id: @user.id)
      @bookmark = create(:bookmark, user: @user, post: @post)
    end

    it 'user_idとpost_idの組み合わせに被りがない場合、バリデーションエラーが起きないか' do
      another_user = create(:user)
      another_post = create(:post, user_id: another_user.id)
      new_bookmark = build(:bookmark, user: another_user, post: another_post)
      expect(new_bookmark).to be_valid
    end

    it 'user_idとpost_idの組み合わせに被りがある場合、バリデーションが機能してinvalidになるか' do
      duplicate_bookmark = build(:bookmark, user: @user, post: @post)
      duplicate_bookmark.valid?
      expect(duplicate_bookmark.errors[:user_id]).to include('has already been taken')
    end
  end
end

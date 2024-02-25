require 'rails_helper'

RSpec.describe PostTag, type: :model do
  describe 'バリデーションチェック' do
    before do
      @post = create(:post)
      @tag = create(:tag)
      # 最初の有効なPostTagを作成する
      @post_tag = create(:post_tag, post: @post, tag: @tag)
    end

    it 'post_idとtag_idの組み合わせに被りがない場合、バリデーションエラーが起きないか' do
      another_post = create(:post)
      another_tag = create(:tag)
      new_post_tag = build(:post_tag, post: another_post, tag: another_tag)
      expect(new_post_tag).to be_valid
    end

    it 'post_idとtag_idの組み合わせに被りがある場合、バリデーションが機能してinvalidになるか' do
      duplicate_post_tag = build(:post_tag, post: @post, tag: @tag)
      duplicate_post_tag.valid?
      expect(duplicate_post_tag.errors[:post_id]).to include('has already been taken')
    end
  end
end

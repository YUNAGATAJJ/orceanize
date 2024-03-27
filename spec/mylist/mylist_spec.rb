require 'rails_helper'

RSpec.describe 'mylist', type: :system do
  include LoginMacros

  let(:user) { create(:user) }
  let(:post) { create(:post, user: user) }
  let(:bookmark) { create(:bookmark, user: user, post: post) }

  it 'マイリスト追加ができること' do
    post
    login_as(user)
    # visit "/posts/#{post.id}"
    find("[href='/bookmarks?post_id=#{post.id}']").click
    expect(current_path).to eq('/posts')
    expect(page).to have_content('マイリストに追加しました')
  end

  it 'マイリストから削除できること' do
    bookmark
    login_as(user)
    find("a.mr-3[data-turbo-method='delete']").click
    expect(current_path).to eq('/posts')
    expect(page).to have_content('マイリストから削除しました')
  end
end

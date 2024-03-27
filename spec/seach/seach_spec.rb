require 'rails_helper'

RSpec.describe 'mylist', type: :system do
  include LoginMacros
  let(:user) { create(:user) }
  let(:post1) { create(:post, title: 'salmon', description: 'so delicious') }
  let(:post2) { create(:post, title: 'tuna', description: 'delicious') }
  let(:post3) { create(:post, title: 'oyster', description: 'so so...') }
  # let(:board4) { create(:board, title: 'RailsとLaravel、どっちがよいか', body: '宗教戦争の話になります。その話をする必要はありません。') }

  describe 'ログイン前' do
    before do
      post1
      post2
      post3
      visit posts_path
    end

    context '検索条件に該当する掲示板がある場合' do
      describe 'タイトルでの検索機能の検証' do
        it '該当する掲示板のみ表示されること' do
          fill_in 'q[title_or_description_cont]', with: 'salmon'
          find('button.btn.btn-primary').click
          Capybara.assert_current_path("/posts", ignore_query: true)
          expect(current_path).to eq(posts_path)
          expect(page).to have_content(post1.title)
          expect(page).not_to have_content(post2.title)
        end
      end
      describe '説明文での検索機能の検証' do
        it '該当する掲示板のみ表示されること' do
          fill_in 'q[title_or_description_cont]', with: 'delicious'
          find('button.btn.btn-primary').click
          Capybara.assert_current_path("/posts", ignore_query: true)
          expect(current_path).to eq(posts_path)
          expect(page).to have_content(post1.title)
          expect(page).to have_content(post2.title)
          expect(page).not_to have_content(post3.description)
        end
      end
      describe '検索機能の検証(ヒットなし)' do
        it '検索結果がヒットしない時は何も表示されないこと' do
          fill_in 'q[title_or_description_cont]', with: 'bad'
          find('button.btn.btn-primary').click
          Capybara.assert_current_path("/posts", ignore_query: true)
          expect(current_path).to eq(posts_path)
          expect(page).not_to have_content(post1.title)
          expect(page).not_to have_content(post2.title)
          expect(page).not_to have_content(post3.description)
        end
      end
    end
  end

  describe 'ログイン後' do
    before do
      login_as(user)
      post1
      post2
      post3
      visit posts_path
    end

    context '検索条件に該当する掲示板がある場合' do
      describe 'タイトルでの検索機能の検証' do
        it '該当する掲示板のみ表示されること' do
          fill_in 'q[title_or_description_cont]', with: 'salmon'
          find('button.btn.btn-primary').click
          Capybara.assert_current_path("/posts", ignore_query: true)
          expect(current_path).to eq(posts_path)
          expect(page).to have_content(post1.title)
          expect(page).not_to have_content(post2.title)
        end
      end
      describe '説明文での検索機能の検証' do
        it '該当する掲示板のみ表示されること' do
          fill_in 'q[title_or_description_cont]', with: 'delicious'
          find('button.btn.btn-primary').click
          Capybara.assert_current_path("/posts", ignore_query: true)
          expect(current_path).to eq(posts_path)
          expect(page).to have_content(post1.title)
          expect(page).to have_content(post2.title)
          expect(page).not_to have_content(post3.description)
        end
      end
      describe '検索機能の検証(ヒットなし)' do
        it '検索結果がヒットしない時は何も表示されないこと' do
          fill_in 'q[title_or_description_cont]', with: 'bad'
          find('button.btn.btn-primary').click
          Capybara.assert_current_path("/posts", ignore_query: true)
          expect(current_path).to eq(posts_path)
          expect(page).not_to have_content(post1.title)
          expect(page).not_to have_content(post2.title)
          expect(page).not_to have_content(post3.description)
        end
      end
    end
  end

end

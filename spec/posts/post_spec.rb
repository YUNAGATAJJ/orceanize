require 'rails_helper'

RSpec.describe 'posts_CRUD', type: :system do
  include LoginMacros

  context 'ログイン前' do
    let(:user) { create(:user) }
    let(:post) { create(:post, user: user) }
    before do
      visit posts_path
    end
    describe 'ログイン前-Create機能非表示' do
      it 'ヘッダーから/postsに遷移できること' do
        expect(current_path).to eq('/posts')
      end
      it '掲示板作成ボタンが表示されないこと' do
        expect(page).not_to have_content('+')
      end
    end
    describe 'ログイン前一覧画面' do
      it '掲示板の一覧が表示されること' do
        post
        visit posts_path
        expect(page).to have_content(post.user.nickname)
        expect(page).to have_content(post.title)
      end
    end
    describe 'ログイン前-show' do
      it '投稿の詳細ページが表示されること' do
        post
        visit "/posts/#{post.id}"
        expect(page).to have_content(post.user.nickname)
        expect(page).to have_content(post.title)
        expect(page).to have_content(post.description)
      end
    end
  end

  context 'ログイン後' do
    let(:user) { create(:user) }
    let(:post) { create(:post, user: user) }
    before do
      login_as(user)
    end

    describe 'ログイン後-Create機能' do
      it '掲示板作成ボタンが表示されていること' do
        expect(page).to have_content('+')
      end
      # it '掲示板が作成できること' do
      #   click_on('+')
      #   fill_in 'Title', with: 'ocean'
      #   fill_in 'Description', with: 'organize'
      #   file_path = Rails.root.join('spec', 'sample_image.jpg')
      #   attach_file "Image", file_path
      #   click_on 'commit'
      #   visit current_path
      #   expect(page).to have_content('作品を登録しました')
      #   expect(page).to have_content("#{user.nickname}")
      #   expect(page).to have_content('ocean')
      #   expect(page).to have_content('organize')
      # end
      # it '掲示板の作成に失敗すること' do
      #   fill_in 'Title', with: 'ocean'
      #   click_button 'Create Post'
      #   expect(page).to have_content('保存できませんでした')
      #   expect(page).to have_content("Description can't be blank")
      #   expect(page).to have_content("Image can't be blank")
      # end
      describe 'ログイン後一覧画面' do
        it '掲示板の一覧が表示されること' do
          post
          visit posts_path
          expect(page).to have_content(post.user.nickname)
          expect(page).to have_content(post.title)
        end
      end
      describe 'ログイン後-show' do
        it '投稿の詳細ページが表示されること' do
          post
          visit "/posts/#{post.id}"
          expect(page).to have_content(post.user.nickname)
          expect(page).to have_content(post.title)
          expect(page).to have_content(post.description)
        end
      end
      describe 'ログイン後-Update' do
        it '投稿を更新できること' do
          post
          visit "/posts/#{post.id}"
          find("a[href='/posts/#{post.id}/edit']").click
          fill_in 'Title', with: 'Edited'
          fill_in 'Description', with: 'Edited'
          click_button 'commit'
          Capybara.assert_current_path("/posts/#{post.id}", ignore_query: true)
          expect(current_path).to eq post_path(post)
          expect(page).to have_content('作品を更新しました')
        end
        it '投稿を更新できないこと' do
          post
          visit "/posts/#{post.id}"
          find("a[href='/posts/#{post.id}/edit']").click
          fill_in 'Title', with: ''
          fill_in 'Description', with: ''
          click_button 'commit'
          expect(current_path).to eq edit_post_path(post)
          expect(page).to have_content("Title can't be blank")
          expect(page).to have_content("Description can't be blank")
        end
      end
      describe 'ログイン後-Delete' do
        it '投稿を削除できること' do
          post
          visit "/posts/#{post.id}"
          page.accept_confirm { find('button[data-turbo-confirm="削除しますか?"]').click }
          expect(page).not_to have_current_path("/posts/#{post.id}")
        end
      end
    end
  end
end

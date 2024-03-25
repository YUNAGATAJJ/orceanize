# require 'rails_helper'

# RSpec.describe '掲示板', type: :system do
#   include LoginMacros
#   let(:another_user) { create(:user) }
#   let(:post) { create(:post, user: user) }

#
    #   context 'ログインしている場合' do
    #     it 'ヘッダーのリンクから掲示板一覧へ遷移できること' do
    #       login_as(user)
    #       click_on('掲示板')
    #       click_on('掲示板一覧')
    #       Capybara.assert_current_path("/boards", ignore_query: true)
    #       expect(current_path).to eq('/boards'), 'ヘッダーのリンクから掲示板一覧画面へ遷移できません'
    #     end


    #     context '掲示板が一件もない場合' do
    #       it '何もない旨のメッセージが表示されること' do
    #         login_as(user)
    #         click_on('掲示板')
    #         click_on('掲示板一覧')
    #         expect(page).to have_content('掲示板がありません'), '掲示板が一件もない場合、「掲示板がありません」というメッセージが表示されていません'
    #       end
    #     end

    #     context '掲示板がある場合' do
    #       it '掲示板の一覧が表示されること' do
    #         board
    #         login_as(user)
    #         click_on('掲示板')
    #         click_on('掲示板一覧')
    #         expect(page).to have_content(board.title), '掲示板一覧画面に掲示板のタイトルが表示されていません'
    #         expect(page).to have_content(board.user.decorate.full_name), '掲示板一覧画面に投稿者のフルネームが表示されていません'
    #         expect(page).to have_content(board.body), '掲示板一覧画面に掲示板の本文が表示されていません'
    #       end
    #     end
    #     context '20件以下の場合' do
    #       let!(:boards) { create_list(:board, 20) }
    #       it 'ページングが表示されないこと' do
    #         login_as(user)
    #         visit boards_path
    #         expect(page).not_to have_selector('.pagination')
    #       end
    #     end

    #     context '21件以上ある場合' do
    #       let!(:boards) { create_list(:board, 21) }
    #       it 'ページングが表示されること' do
    #         login_as(user)
    #         visit boards_path
    #         expect(page).to have_selector('.pagination'), '掲示板一覧画面において掲示板が21件以上ある場合に、ページネーションのリンクが表示されていません'
    #       end
    #     end
    #   end
    # end
    # describe '掲示板の詳細' do
    #   context 'ログインしていない場合' do
    #     it 'ログインページにリダイレクトされること' do
    #       visit board_path(board)
    #       expect(current_path).to eq login_path
    #       expect(page).to have_content 'ログインしてください'
    #     end
    #   end

    #   context 'ログインしている場合' do
    #     before do
    #       board
    #       login_as(user)
    #     end
    #     it '掲示板の詳細が表示されること' do
    #       click_on('掲示板')
    #       click_on('掲示板一覧')
    #       within "#board-id-#{board.id}" do
    #         page.find_link(board.title, exact_text: true).click
    #       end
    #       Capybara.assert_current_path("/boards/#{board.id}", ignore_query: true)
    #       expect(current_path).to eq("/boards/#{board.id}"), '掲示板のタイトルリンクから掲示板詳細画面へ遷移できません'
    #       expect(page).to have_content board.title
    #       expect(page).to have_content board.user.decorate.full_name
    #       expect(page).to have_content board.body
    #     end
    #     it '正しいタイトルが表示されていること' do
    #       click_on('掲示板')
    #       click_on('掲示板一覧')
    #       within "#board-id-#{board.id}" do
    #         page.find_link(board.title, exact_text: true).click
    #       end
    #       expect(page).to have_title("#{board.title} | RUNTEQ BOARD APP"), '掲示板詳細ページのタイトルに掲示板のタイトルが含まれていません。'
    #     end
    #   end
    # end
    # describe '掲示板の作成' do
    #   context 'ログインしていない場合' do
    #     it 'ログインページにリダイレクトされること' do
    #       visit '/boards/new'
    #       Capybara.assert_current_path("/login", ignore_query: true)
    #       expect(current_path).to eq('/login'), 'ログインしていない場合、掲示板作成画面にアクセスした際に、ログインページにリダイレクトされていません'
    #       expect(page).to have_content('ログインしてください'), 'フラッシュメッセージ「ログインしてください」が表示されていません'
    #     end
    #   end

    #   context 'ログインしている場合' do
    #     before do
    #       login_as(user)
    #       click_on('掲示板')
    #       click_on('掲示板作成')
    #     end

    #     it '正しいタイトルが表示されていること' do
    #       expect(page).to have_title("掲示板作成 | RUNTEQ BOARD APP"), '掲示板新規作成ページのタイトルに「掲示板作成 | RUNTEQ BOARD APP」が含まれていません。'
    #     end

    #     it '掲示板が作成できること' do
    #       fill_in 'タイトル', with: 'テストタイトル'
    #       fill_in '本文', with: 'テスト本文'
    #       file_path = Rails.root.join('spec', 'fixtures', 'example.jpg')
    #       attach_file "サムネイル", file_path
    #       click_button '登録'
    #       Capybara.assert_current_path("/boards", ignore_query: true)
    #       expect(current_path).to eq('/boards'), '掲示板一覧画面に遷移していません'
    #       expect(page).to have_content('掲示板を作成しました'), 'フラッシュメッセージ「掲示板を作成しました」が表示されていません'
    #       expect(page).to have_content('テストタイトル'), '作成した掲示板のタイトルが表示されていません'
    #       expect(page).to have_content('テスト本文'), '作成した掲示板の本文が表示されていません'
    #     end

    #     it '掲示板の作成に失敗すること' do
    #       fill_in 'タイトル', with: 'テストタイトル'
    #       file_path = Rails.root.join('spec', 'fixtures', 'example.txt')
    #       attach_file "サムネイル", file_path
    #       click_button '登録'
    #       expect(page).to have_content('掲示板を作成出来ませんでした'), 'フラッシュメッセージ「掲示板を作成出来ませんでした」が表示されていません'
    #       expect(page).to have_content('本文を入力してください'), 'エラーメッセージ「本文を入力してください」が表示されていません'
    #     end
    #   end
    # end

    # describe '掲示板の更新' do
    #   before { board }
    #   context 'ログインしていない場合' do
    #     it 'ログインページにリダイレクトされること' do
    #       visit edit_board_path(board)
    #       expect(current_path).to eq('/login'), 'ログインページにリダイレクトされていません'
    #       expect(page).to have_content 'ログインしてください'
    #     end
    #   end

    #   context 'ログインしている場合' do
    #     context '自分の掲示板' do
    #       before do
    #         login_as(user)
    #         visit boards_path
    #         find("#button-edit-#{board.id}").click
    #       end
    #       it '掲示板が更新できること' do
    #         fill_in 'タイトル', with: '編集後テストタイトル'
    #         fill_in '本文', with: '編集後テスト本文'
    #         click_button '更新'
    #         Capybara.assert_current_path("/boards/#{board.id}", ignore_query: true)
    #         expect(current_path).to eq board_path(board)
    #         expect(page).to have_content('掲示板を更新しました'), 'フラッシュメッセージ「掲示板を更新しました」が表示されていません'
    #         expect(page).to have_content('編集後テストタイトル'), '更新後のタイトルが表示されていません'
    #         expect(page).to have_content('編集後テスト本文'), '更新後の本文が表示されていません'
    #       end

    #       it '掲示板の作成に失敗すること' do
    #         fill_in 'タイトル', with: '編集後テストタイトル'
    #         fill_in '本文', with: ''
    #         click_button '更新'
    #         expect(page).to have_content('掲示板を更新出来ませんでした'), 'フラッシュメッセージ「掲示板を更新出来ませんでした」が表示されていません'
    #       end
    #     end

    #     context '他人の掲示板' do
    #       it '編集ボタンが表示されないこと' do
    #         login_as(another_user)
    #         visit boards_path
    #         expect(page).not_to have_selector("#button-edit-#{board.id}"), '他人の掲示板に対して編集ボタンが表示されています'
    #       end
    #     end
    #   end
    # end

    # describe '掲示板の削除' do
    #   before { board }
    #   context '自分の掲示板' do
    #     it '掲示板が削除できること' do
    #       login_as(user)
    #       visit '/boards'
    #       page.accept_confirm { find("#button-delete-#{board.id}").click }
    #       expect(current_path).to eq('/boards'), '掲示板削除後に、掲示板の一覧ページに遷移していません'
    #       expect(page).to have_content('掲示板を削除しました'), 'フラッシュメッセージ「掲示板を削除しました」が表示されていません'
    #     end
    #   end

    #   context '他人の掲示板' do
    #     it '削除ボタンが表示されないこと' do
    #       login_as(another_user)
    #       visit boards_path
    #       expect(page).not_to have_selector("#button-delete-#{board.id}"), '他人の掲示板に対して削除ボタンが表示されています'
    #     end
    #   end
    # end
    # describe '掲示板のブックマーク一覧' do
    #   before { board }
    #   context '1件もブックマークしていない場合' do
    #     it '1件もない旨のメッセージが表示されること' do
    #       login_as(user)
    #       visit boards_path
    #       click_on 'ブックマーク一覧'
    #       Capybara.assert_current_path("/boards/bookmarks", ignore_query: true)
    #       expect(current_path).to eq(bookmarks_boards_path), '課題で指定した形式のリンク先に遷移させてください'
    #       expect(page).to have_content('ブックマーク中の掲示板がありません'), 'ブックマーク中の掲示板が一件もない場合、「ブックマーク中の掲示板がありません」というメッセージが表示されていません'
    #     end
    #   end

    #   context 'ブックマークしている場合' do
    #     it 'ブックマークした掲示板が表示されること' do
    #       login_as(another_user)
    #       visit boards_path
    #       find("#bookmark-button-for-board-#{board.id}").click
    #       click_on 'ブックマーク一覧'
    #       Capybara.assert_current_path("/boards/bookmarks", ignore_query: true)
    #       expect(current_path).to eq(bookmarks_boards_path), '課題で指定した形式のリンク先に遷移させてください'
    #       expect(page).to have_content board.title
    #     end
    #   end

    #   context '20件以下の場合' do
    #     let!(:boards) { create_list(:board, 20) }
    #     it 'ページングが表示されないこと' do
    #       boards.each { |board| Bookmark.create(user: another_user, board: board) }
    #       login_as(another_user)
    #       visit bookmarks_boards_path
    #       expect(page).not_to have_selector('.pagination'), 'ブックマーク一覧画面において掲示板が20件以下の場合、ページネーションを表示させてはいけません'
    #     end
    #   end

    #   context '21件以上ある場合' do
    #     let!(:boards) { create_list(:board, 21) }
    #     it 'ページングが表示されること' do
    #       boards.each { |board| Bookmark.create(user: another_user, board: board) }
    #       login_as(another_user)
    #       visit bookmarks_boards_path
    #       expect(page).to have_selector('.pagination'), 'ブックマーク一覧画面において掲示板が21件以上ある場合、ページネーションが表示されていません'
    #     end
    #   end
#     end
#   end
# end


# 新規

require 'rails_helper'

RSpec.describe 'posts_CRUD', type: :system do
  include LoginMacros

  context 'ログイン前' do
    before do
      visit posts_path
    end
    describe 'ログイン前-Create機能' do
      it '掲示板作成ボタンが表示されないこと' do
        expect(page).not_to have_content('+')
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
      it '+が表示されている' do
        expect(page).to have_content('+')
      end
      # it '掲示板が作成できること' do
      #   click_on('+')
      #   fill_in 'Title', with: 'ocean'
      #   fill_in 'Description', with: 'organize'
      #   file_path = Rails.root.join('spec', 'sample_image.jpg')
      #   attach_file "Image", file_path
      #   click_button 'Create Post'
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
    end
  end
end

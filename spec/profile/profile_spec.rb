require 'rails_helper'

RSpec.describe 'profile', type: :system do
  include LoginMacros

    describe 'プロフィール' do
      let(:user) { create(:user) }
      before do
        login_as(user)
      end

      it 'プロフィール情報が表示されていること' do
        expect(page).to have_content("#{user.nickname}さん")
        click_on("#{user.nickname}さん")
        Capybara.assert_current_path("/profile", ignore_query: true)
        expect(current_path).to eq(profile_path)
        expect(page).to have_content(user.nickname)
        expect(page).to have_content(user.email)
      end

      it 'プロフィールの編集ができること' do
        click_on("#{user.nickname}さん")
        click_on '編集'
        Capybara.assert_current_path("/profile/edit", ignore_query: true)
        expect(current_path).to eq(edit_profile_path)
        fill_in 'Nickname', with: 'omg i was edited!'
        fill_in 'Email', with: 'edit@example.com'
        # file_path = Rails.root.join('spec', 'sample_image.jpg')
        # attach_file "Avatar", file_path
        click_on 'commit'
        Capybara.assert_current_path("/profile", ignore_query: true)
        expect(current_path).to eq(profile_path)
        expect(page).to have_content('ユーザ情報が更新されました')
        expect(page).to have_content('omg i was edited!')
        expect(page).to have_content('edit@example.com')
        # expect(page).to have_selector("img[src$='example.jpg']")
      end

      it 'プロフィールの編集に失敗すること' do
        click_on("#{user.nickname}さん")
        click_on '編集'
        Capybara.assert_current_path("/profile/edit", ignore_query: true)
        expect(current_path).to eq(edit_profile_path), 'プロフィール編集ページに遷移していません'
        fill_in 'Nickname', with: ''
        fill_in 'Email', with: ''
        click_button 'commit'
        expect(page).to have_content('プロフィールを更新できませんでした')
        expect(page).to have_content("Nickname can't be blank")
        expect(page).to have_content("Email can't be blank")
      end
    end
end

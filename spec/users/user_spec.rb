require 'rails_helper'

RSpec.describe 'ユーザー登録', type: :system do
  context '入力情報正常系' do
    it 'ユーザーが新規作成できること' do
      visit '/users/new'
      expect {
        fill_in 'Nickname', with: 'orceanize'
        fill_in 'user[email]', with: 'orceanize@example.com'
        fill_in 'Password', with: 'password'
        fill_in 'Password confirmation', with: 'password'
        click_button 'Sign UP'
        Capybara.assert_current_path("/", ignore_query: true)
      }.to change { User.count }.by(1)
      expect(page).to have_content('新規ユーザを作成しました')
    end
  end

  context '入力情報異常系' do
    it 'ユーザーが新規作成できないこと' do
      visit '/users/new'
      expect {
        fill_in 'user[email]', with: 'orceanize@example.com'
        click_button 'Sign UP'
      }.to change { User.count }.by(0)
      expect(page).to have_content('ユーザ作成に失敗しました')
      expect(page).to have_content('Password is too short (minimum is 3 characters)')
      expect(page).to have_content("Password confirmation can't be blank")
      expect(page).to have_content("Nickname can't be blank")
    end
  end
end

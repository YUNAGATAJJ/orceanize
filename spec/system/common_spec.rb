require 'rails_helper'

RSpec.describe '共通系', type: :system do
  before do
    visit root_path
  end
  describe 'ヘッダー' do
    it 'ヘッダーが正しく表示されていること' do
      expect(page).to have_content('Orceanize')
      expect(page).to have_content('Orceanizeとは')
      expect(page).to have_content('Gallery')
      expect(page).to have_content('Sign-In')
      expect(page).to have_content('Sign-Up')
    end
  end

  describe 'フッター' do
    it 'フッターが正しく表示されていること' do
      expect(page).to have_content('外部リンク')
      expect(page).to have_content('プライバシーポリシー')
      expect(page).to have_content('利用規約')
    end
  end
end

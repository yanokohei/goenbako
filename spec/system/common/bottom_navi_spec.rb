require 'rails_helper'

RSpec.describe "ボトムナビゲーション", type: :system do
  let!(:user) { create(:user) }
  before do
    visit root_path
  end

  context 'ログイン前' do
    it 'ボトムナビゲーションにボタン(３種)が表示されていること' do
      expect(page).to have_link 'Top'
      expect(page).to have_content 'Random'
      expect(page).to have_content 'Search'
    end

    it 'ユーザー検索ができる' do
      click_on 'Search'
      expect(page).to have_content('ユーザー検索')
    end

    it 'ボトムナビゲーションにHome、Settingボタンが表示されていないこと' do
      expect(page).to have_no_content 'Home'
      expect(page).to have_no_content 'Setting'
    end
  end
end

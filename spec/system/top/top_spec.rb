require 'rails_helper'

RSpec.describe "ユーザー", type: :system do
  let!(:user) { create(:user) }
  before do
    visit root_path
  end

  context 'ログイン前' do
    it '「Twitter認証して始める」ボタンが表示されていること' do
      expect(page).to have_link 'Twitter認証して始める'
    end
  end
end

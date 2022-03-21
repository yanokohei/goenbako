require 'rails_helper'

RSpec.describe "ヘッダー", type: :system do
  let!(:user) { create(:user) }
  before do
    visit root_path
  end

  context 'ヘルプボックス' do
    it 'クリックするとルールカードが表示される' do
      find("button[name='help-box']").click
      expect(page).to have_content 'ご縁箱の使い方'
    end
  end
end

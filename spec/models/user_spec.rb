require 'rails_helper'

RSpec.describe User, type: :model do
  let(:user) { build(:user) }

  describe 'テストデータの検証' do
    it 'テストデータは有効です' do
      expect(user).to be_valid
    end
  end

  describe '関連付けチェック' do
    it 'has_one :authentications, destroy' do
      is_expected.to have_many(:authentications).dependent(:destroy)
    end

    it 'has_many :letters, destroy' do
      is_expected.to have_many(:letters).dependent(:destroy)
    end

    it 'has_many :receivers, destroy' do
      is_expected.to have_many(:receivers).dependent(:destroy)
    end
  end

  describe 'バリデーションチェック' do
    before { create(:user) }

    it 'twitter_id: presence' do
      is_expected.to validate_presence_of(:twitter_id)
    end

    it 'twitter_id: uniqueness' do
      is_expected.to validate_uniqueness_of(:twitter_id)
    end

    it 'name: presence' do
      is_expected.to validate_presence_of(:name)
    end

    it 'name: length < 50' do
      is_expected.to validate_length_of(:name).is_at_most(50)
    end

    it 'introduce: length < 300' do
      is_expected.to validate_length_of(:introduce).is_at_most(300)
    end

    it 'role: presence' do
      is_expected.to validate_presence_of(:role)
    end
  end
end

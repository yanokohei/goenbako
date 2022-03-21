require 'rails_helper'

RSpec.describe Authentication, type: :model do
  describe '関連付けチェック' do
    it 'belongs_to :user' do
      is_expected.to belong_to(:user)
    end
  end

  describe 'バリデーションチェック' do
    it 'uid: presence' do
      is_expected.to validate_presence_of(:uid)
    end

    it 'provider: presence' do
      is_expected.to validate_presence_of(:provider)
    end
  end
end

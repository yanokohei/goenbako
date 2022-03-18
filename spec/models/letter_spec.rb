require 'rails_helper'

RSpec.describe Letter, type: :model do
  describe '関連付けチェック' do
    it 'belongs_to :sender' do
      is_expected.to belong_to(:sender)
    end
    it 'belongs_to :receiver' do
      is_expected.to belong_to(:receiver)
    end
    it 'has_many :share_images, destroy' do
      is_expected.to have_many(:share_images).dependent(:destroy)
    end
  end

  describe 'バリデーションチェック' do
    it 'past: length < 100' do
      is_expected.to validate_length_of(:past).is_at_most(100)
    end
    it 'current: length < 100' do
      is_expected.to validate_length_of(:current).is_at_most(100)
    end
    it 'future: length < 100' do
      is_expected.to validate_length_of(:future).is_at_most(100)
    end
    it 'expect: length < 100' do
      is_expected.to validate_length_of(:expect).is_at_most(100)
    end
    it 'message: length < 100' do
      is_expected.to validate_length_of(:message).is_at_most(100)
    end
  end
end

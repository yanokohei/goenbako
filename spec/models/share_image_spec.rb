require 'rails_helper'

RSpec.describe ShareImage, type: :model do
  describe '関連付けチェック' do
    it 'belongs_to :letter' do
      is_expected.to belong_to(:letter)
    end
  end
end

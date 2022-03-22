class User < ApplicationRecord
  before_save :modify_avatar_url, :modify_user_name
  authenticates_with_sorcery!

  has_many :authentications, dependent: :destroy
  has_many :letters, foreign_key: :sender_id, dependent: :destroy, inverse_of: 'sender'
  has_many :received_letters, class_name: 'Letter', foreign_key: :receiver_id, dependent: :destroy, inverse_of: 'receiver'

  accepts_nested_attributes_for :authentications

  enum role: { general: 1, admin: 10 }

  validates :twitter_id, presence: true, uniqueness: true
  validates :name, presence: true, length: { maximum: 50 }
  validates :introduce, length: { maximum: 300 }
  validates :role, presence: true

  private

    def modify_avatar_url
      image&.sub!(/_normal(.jpg|.jpeg|.gif|.png)/i) { Regexp.last_match[1] }
    end

    def modify_user_name
      name.gsub!(/\||%|<|>/, "｜")
    end
end

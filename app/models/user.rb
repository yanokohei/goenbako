class User < ApplicationRecord
  before_save :modify_avatar_url
  authenticates_with_sorcery!

  has_many :authentications, dependent: :destroy
  has_many :letters, foreign_key: :sender_id, dependent: :destroy
  has_many :sent_letters, through: :letters, source: :receiver # lettersテーブルを経由してreveive_id列を参照する
  has_many :receivers, class_name: 'Letter', foreign_key: :receiver_id, dependent: :destroy
  has_many :received_letters, through: :receivers, source: :sender # receiversテーブルを経由してsender_idを参照する

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
end

class User < ApplicationRecord
  authenticates_with_sorcery!

  has_many :authentications, dependent: :destroy
  has_many :letters, foreign_key: :sender_id, dependent: :destroy
  has_many :send_letters, through: :letters, source: :received_letter

  has_many :receivers, class_name: "Letter", foreign_key: :receiver_id, dependent: :destroy
  has_many :received_letters, through: :receivers, source: :send_letter

  accepts_nested_attributes_for :authentications

  validates :twitter_id, presence: true, uniqueness: true
  validates :name, presence: true, length: { maximum: 50 }
  validates :introduce, length: { maximum: 300 }
  validates :role, presence: true
end

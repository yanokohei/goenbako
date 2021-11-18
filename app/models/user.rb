class User < ApplicationRecord
  authenticates_with_sorcery!

  has_many :authentications, dependent: :destroy

  has_many :letters, foreign_key: :sender_id, dependent: :destroy
  has_many :sent_letters, through: :letters, source: :receiver #lettersテーブルを経由してreveive_id列を参照する

  has_many :receivers, class_name: "Letter", foreign_key: :receiver_id, dependent: :destroy
  has_many :received_letters, through: :receivers, source: :sender # receiversテーブルを経由してsender_idを参照する

  accepts_nested_attributes_for :authentications

  validates :twitter_id, presence: true, uniqueness: true
  validates :name, presence: true, length: { maximum: 50 }
  validates :introduce, length: { maximum: 300 }
  validates :role, presence: true
end

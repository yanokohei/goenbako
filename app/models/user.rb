class User < ApplicationRecord
  authenticates_with_sorcery!
  has_many :authentications, dependent: :destroy
  has_many :send_letters, class_name: "Letter", foreign_key: :from_user_id, dependent: :destroy
  has_many :received_letters, class_name: "Letter", foreign_key: :to_user_id, dependent: :destroy

  accepts_nested_attributes_for :authentications


  validates :twitter_id, presence: true, uniqueness: true
  validates :name, presence: true, length: { maximum: 50 }
  validates :introduce, length: { maximum: 300 }
  validates :role, presence: true
end

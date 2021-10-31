class User < ApplicationRecord
  authenticates_with_sorcery!
  accepts_nested_attributes_for :authentications
  has_many :authentications, dependent: :destroy
  has_many :letters, dependent: :destroy

  validates :twitter_id, presence: true, uniqueness: true
  validates :name, presence: true, length: { maximum: 50 }
  validates :introduce, length: { maximum: 300 }
  validates :role, presence: true
end

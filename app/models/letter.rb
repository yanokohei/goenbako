class Letter < ApplicationRecord
  belongs_to :user

  validates :to_user_id, presence: true, numericality: { only_integer: true }
  validates :past, length: { maximum: 140 }
  validates :current, length: { maximum: 140 }
  validates :future, length: { maximum: 140 }
  validates :expect, length: { maximum: 140 }
  validates :message, length: { maximum: 140 }
end

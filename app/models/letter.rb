class Letter < ApplicationRecord
  belongs_to :user, foreign_key: :from_user_id

  validates :to_user_id, presence: true, numericality: { only_integer: true }
  with_options length: { maximum: 140 } do
    validates :past
    validates :current
    validates :future
    validates :expect
    validates :message
  end
end

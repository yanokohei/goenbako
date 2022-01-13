class Letter < ApplicationRecord
  belongs_to :sender, class_name: 'User'
  belongs_to :receiver, class_name: 'User'
  has_many :share_images

  validates :sender_id, presence: true
  validates :receiver_id, presence: true

  with_options length: { maximum: 100 } do
    validates :past
    validates :current
    validates :future
    validates :expect
    validates :message
  end

  validates :letter_items, presence: true

  private

    def letter_items
      past.presence or current.presence or future.presence or expect.presence or message.presence
    end
end

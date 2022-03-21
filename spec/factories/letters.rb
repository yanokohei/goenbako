FactoryBot.define do
  factory :letter do
    user
    sequence(:sender_id, '1')
    sequence(:receiver_id, '2')
    past { '' }
    current { '' }
    future { '' }
    expect { '' }
    message { '' }
  end
end

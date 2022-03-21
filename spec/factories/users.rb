FactoryBot.define do
  factory :user do
    sequence(:twitter_id, 'twi_id_1')
    sequence(:name, 'user_1')
    introduce { '' }
    role { 1 }
    email { 'test_1@example.com' }
  end
end

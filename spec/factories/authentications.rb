FactoryBot.define do
  factory :authentication do
    user
    sequence(:uid, 'uid_1')
    provider { 'twitter' }
  end
end

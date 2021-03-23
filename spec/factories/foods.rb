FactoryBot.define do
  factory :food do
    name { Faker::Name }
    explain { 'aaa' }

    association :user
    association :shop

    after(:build) do |food|
      food.image.attach(io: File.open('public/images/test_img.png'), filename: 'test_img.png')
    end
  end
end

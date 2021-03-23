FactoryBot.define do
  factory :shop do
    name {Faker::Name}
    category_id {2}
    address {'aaa'}
    explain {'aaa'}

    association :user

    after(:build) do |shop|
      shop.image.attach(io: File.open('public/images/test_img.png'), filename: 'test_img.png')
    end
  end
end

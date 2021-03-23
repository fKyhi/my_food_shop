FactoryBot.define do
  factory :user do
    nickname              { 'aaa' }
    email                 { Faker::Internet.free_email }
    password              { '111aaa' }
    password_confirmation { '111aaa' }
  end
end

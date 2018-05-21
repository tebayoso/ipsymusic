FactoryBot.define do
  factory :playlist do
    name { Faker::Lorem.sentence }
    author { Faker::Internet.user_name }
    date { Time.at((10.year.ago.to_f - 1.year.ago.to_f) * rand + 1.year.ago.to_f) }
  end
end

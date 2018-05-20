FactoryBot.define do
  factory :album do
    name { Faker::Lorem.sentence }
    author nil
    duration { rand(900..1800) }
    date { Time.at((10.year.ago.to_f - 1.year.ago.to_f) * rand + 1.year.ago.to_f) }
  end
end

FactoryBot.define do
  factory :song do
    name { "#{Faker::Lorem.sentence} #{Faker::Lorem.word}" }
    author nil
    duration { rand(200..500) }
    date { Time.at((1.year.ago.to_f - 1.year.from_now.to_f) * rand + 1.year.from_now.to_f) }
  end
end

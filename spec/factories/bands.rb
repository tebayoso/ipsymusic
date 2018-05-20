FactoryBot.define do
  factory :band do
    name { Faker::LeagueOfLegends.champion }
    bio { Faker::Lorem.paragraph }
    start_date { Time.at((10.year.ago.to_f - 1.year.ago.to_f) * rand + 1.year.ago.to_f) }
    end_date { start_date + 1.year }
  end
end

FactoryBot.define do
  factory :artist do
    name { "#{Faker::LeagueOfLegends.champion} #{Faker::Lorem.sentence}" }
    bio { Faker::Lorem.paragraph }
    birthdate { Time.at((10.year.ago.to_f - 1.year.ago.to_f) * rand + 1.year.ago.to_f) }
    alter_name { [Faker::Lovecraft.deity, nil].sample }
  end
end

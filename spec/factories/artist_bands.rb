FactoryBot.define do
  factory :artist_band do
    association :artist, factory: :artist, strategy: :build
    association :band, factory: :band, strategy: :build
    joined { Time.at((10.year.ago.to_f - 1.year.ago.to_f) * rand + 1.year.ago.to_f) }
    left { joined + 5.years }
  end
end

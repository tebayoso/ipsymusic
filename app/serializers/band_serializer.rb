class BandSerializer
  include FastJsonapi::ObjectSerializer
  set_type :band
  cache_options enabled: true, cache_length: 1.hour
  attributes :name, :bio, :start_date, :end_date
  has_many :albums, record_type: :album
  has_many :songs, record_type: :song
  has_many :artists, record_type: :artist
end

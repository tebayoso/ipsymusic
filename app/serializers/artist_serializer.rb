class ArtistSerializer
  include FastJsonapi::ObjectSerializer
  set_type :artist
  cache_options enabled: true, cache_length: 1.hour
  attributes :name, :bio, :birthdate, :alter_name
  has_many :songs, record_type: :song
  has_many :bands, record_type: :band
  has_many :albums, record_type: :album
end

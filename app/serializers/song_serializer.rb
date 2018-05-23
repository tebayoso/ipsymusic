class SongSerializer
  include FastJsonapi::ObjectSerializer
  set_type :song
  cache_options enabled: true, cache_length: 1.hour
  attributes :name, :duration, :date
  belongs_to :author, polymorphic: { Artist: :artist, Band: :band }
  has_many :playlists, record_type: :playlist
  has_many :albums, record_type: :album
end

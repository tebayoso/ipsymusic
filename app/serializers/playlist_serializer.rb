class PlaylistSerializer
  include FastJsonapi::ObjectSerializer
  set_type :playlist
  cache_options enabled: true, cache_length: 1.hour
  attributes :name, :author, :date
  has_many :songs, record_type: :song
end

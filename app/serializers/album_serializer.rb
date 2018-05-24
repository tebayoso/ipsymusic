class AlbumSerializer
  include FastJsonapi::ObjectSerializer
  set_type :album
  cache_options enabled: true, cache_length: 1.hour
  attributes :name, :date
  has_many :songs, record_type: :song
  belongs_to :author, polymorphic: { Artist: :artist, Band: :band }
end

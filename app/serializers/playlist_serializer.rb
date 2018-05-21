class PlaylistSerializer < ActiveModel::Serializer
  attributes :name, :author, :date
  has_many :songs
end

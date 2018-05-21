class ArtistSerializer < ActiveModel::Serializer
  attributes :name, :bio, :birthdate, :alter_name
  has_many :songs
  has_many :bands
end

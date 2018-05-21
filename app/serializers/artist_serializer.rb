class ArtistSerializer < ActiveModelSerializers::Model
  attributes :name, :bio, :birthdate, :alter_name
  has_many :songs
end

class AlbumSerializer < ActiveModelSerializers::Model
  attributes :name, :author, :date
  has_many :songs
end
class AlbumSerializer < ActiveModel::Serializer
  attributes :name, :author, :date
  has_many :songs
end

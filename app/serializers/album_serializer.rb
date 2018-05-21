class AlbumSerializer < ActiveModel::Serializer
  attributes :name, :author, :date
  has_many :songs
  belongs_to :author
end

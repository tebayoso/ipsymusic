class ArtistSerializer < ActiveModel::Serializer
  attributes :name, :bio, :start_date, :end_date
  has_many :albums
end

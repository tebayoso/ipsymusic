class BandSerializer < ActiveModel::Serializer
  attributes :name, :bio, :start_date, :end_date
  has_many :albums
  has_many :songs
end

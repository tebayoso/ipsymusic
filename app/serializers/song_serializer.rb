class SongSerializer < ActiveModel::Serializer
  attributes :name, :duration, :date, :author
  belongs_to :author
end

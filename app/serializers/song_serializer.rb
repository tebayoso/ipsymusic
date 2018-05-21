class SongSerializer < ActiveModel::Serializer
  attributes :name, :duration, :date, :author
end

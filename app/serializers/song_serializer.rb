class SongSerializer < ActiveModelSerializers::Model
  attributes :name, :duration, :date, :author
end

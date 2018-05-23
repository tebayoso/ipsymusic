# frozen_string_literal: true

class Album < ApplicationRecord
  include Swagger::Blocks

  swagger_schema :Album do
    key :required, %i[name]
    property :name do
      key :type, :string
    end
    property :author_id do
      key :description, 'The author id in the database'
      key :type, :integer
      key :format, :int64
    end
    property :author_type do
      key :description, 'The Author type, options=[Band, Artist]'
      key :type, :string
    end
    property :date do
      key :description, 'format=[mm/dd/yyyy]'
      key :type, :string
      key :format, :dateTime
    end
    property :song_ids do
      key :type, :array
      items do
        key :type, :integer
        key :format, :int64
      end
    end
  end
  swagger_schema :AlbumInput do
    key :id, :AlbumInput
    property :album do
      key :'$ref', :Album
    end
  end

  searchkick

  belongs_to :author, polymorphic: true
  has_many :album_songs, dependent: :destroy
  has_many :songs, through: :album_songs, source: :song

  validates :name, presence: true, uniqueness: { scope: %i[author] }
end

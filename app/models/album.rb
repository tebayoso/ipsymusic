# frozen_string_literal: true

class Album < ApplicationRecord
  include Swagger::Blocks

  swagger_schema :Album do
    key :required, %i[id name]
    property :name do
      key :type, :string
    end
    property :author_id do
      key :type, :integer
      key :format, :int64
    end
    property :author_type do
      key :type, :string
    end
    property :date do
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
    allOf do
      schema do
        key :'$ref', :Album
      end
      schema do
        key :required, [:name]
        property :id do
          key :type, :integer
          key :format, :int64
        end
      end
    end
  end

  belongs_to :author, polymorphic: true
  has_many :album_songs
  has_many :songs, through: :album_songs, source: :song

  validates :name, presence: true, uniqueness: { scope: %i[author] }
end

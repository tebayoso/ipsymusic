# frozen_string_literal: true

class Song < ApplicationRecord
  include Swagger::Blocks

  swagger_schema :Song do
    key :required, %i[name]
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
    property :duration do
      key :type, :integer
      key :format, :int64
    end
    property :date do
      key :type, :string
      key :format, :dateTime
    end
  end
  swagger_schema :SongInput do
    key :id, :SongInput
    property :song do
      key :'$ref', :Song
    end
  end

  searchkick

  belongs_to :author, polymorphic: true
  has_many :album_songs, dependent: :destroy
  has_many :albums, through: :album_songs, source: :album

  has_many :playlist_songs, dependent: :destroy
  has_many :playlists, through: :playlist_songs, source: :playlist

  validates :name, presence: true, uniqueness: { scope: %i[author duration date] }
end

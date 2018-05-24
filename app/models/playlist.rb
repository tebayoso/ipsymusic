# frozen_string_literal: true

class Playlist < ApplicationRecord
  include Swagger::Blocks

  swagger_schema :Playlist do
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
  swagger_schema :PlaylistInput do
    key :id, :PlaylistInput
    property :playlist do
      key :'$ref', :Playlist
    end
  end

  searchkick

  has_many :playlist_songs, dependent: :destroy
  has_many :songs, through: :playlist_songs, source: :song

  validates :name, presence: true, uniqueness: { scope: [:author] }
  validates :author, presence: true, uniqueness: true
end

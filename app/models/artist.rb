# frozen_string_literal: true

class Artist < ApplicationRecord
  include Swagger::Blocks

  swagger_schema :Artist do
    key :required, %i[name]
    property :name do
      key :type, :string
    end
    property :bio do
      key :type, :string
    end
    property :alter_name do
      key :type, :string
    end
    property :birthdate do
      key :type, :string
      key :format, :dateTime
    end
  end
  swagger_schema :ArtistInput do
    key :id, :ArtistInput
    property :artist do
      key :'$ref', :Artist
    end
  end

  searchkick

  validates :name, presence: true, uniqueness: true
  has_many :artist_bands, dependent: :destroy
  has_many :bands, through: :artist_bands, source: :artist
  has_many :songs, as: :author, dependent: :destroy
  has_many :albums, as: :author, dependent: :destroy
end

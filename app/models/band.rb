# frozen_string_literal: true

class Band < ApplicationRecord
  include Swagger::Blocks

  swagger_schema :Band do
    key :required, %i[name]
    property :name do
      key :type, :string
    end
    property :bio do
      key :type, :string
    end
    property :start_date do
      key :type, :string
      key :format, :dateTime
    end
    property :end_date do
      key :type, :string
      key :format, :dateTime
    end
    property :artist_bands_attributes do
      key :type, :array
      items do
        property :artist_id do
          key :description, 'Artist ID'
          key :type, :integer
          key :format, :int64
        end
        property :joined do
          key :description, 'Date in which the artist joined the band'
          key :type, :string
          key :format, :dateTime
        end
        property :left do
          key :description, 'Date in which the artist left the band'
          key :type, :string
          key :format, :dateTime
        end
      end
    end
  end
  swagger_schema :BandInput do
    key :id, :BandInput
    property :band do
      key :'$ref', :Band
    end
  end

  searchkick

  validates :name, presence: true
  has_many :artist_bands
  accepts_nested_attributes_for :artist_bands
  has_many :artists, through: :artist_bands, source: :artist
  has_many :songs, as: :author
  has_many :albums, as: :author
end

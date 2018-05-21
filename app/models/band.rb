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
    property :artist_ids do
      key :type, :array
      items do
        key :type, :integer
        key :format, :int64
      end
    end
  end
  swagger_schema :BandInput do
    allOf do
      schema do
        key :'$ref', :Band
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

  searchkick

  validates :name, presence: true
  has_many :artist_bands
  has_many :artists, through: :artist_bands, source: :artist
  has_many :songs, as: :author
  has_many :albums, as: :author
end

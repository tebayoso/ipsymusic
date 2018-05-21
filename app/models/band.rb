# frozen_string_literal: true

class Band < ApplicationRecord
  validates :name, presence: true
  has_many :artist_bands
  has_many :artists, through: :artist_bands, source: :artist
end

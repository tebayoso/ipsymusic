# frozen_string_literal: true

class Artist < ApplicationRecord
  validates :name, presence: true, uniqueness: true
  has_many :artist_bands
  has_many :bands, through: :artist_bands, source: :artist
end

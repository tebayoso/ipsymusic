# frozen_string_literal: true

class ArtistBand < ApplicationRecord
  belongs_to :artist
  belongs_to :band
end

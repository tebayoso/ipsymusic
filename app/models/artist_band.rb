# frozen_string_literal: true

class ArtistBand < ApplicationRecord
  belongs_to :artist
  belongs_to :band

  def join=(date)
    joined = date
  end

  def leave=(date)
    left = date
  end
end

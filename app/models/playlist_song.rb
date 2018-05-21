# frozen_string_literal: true

class PlaylistSong < ApplicationRecord
  belongs_to :song
  belongs_to :playlist
end

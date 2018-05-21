# frozen_string_literal: true

class Playlist < ApplicationRecord
  has_many :playlist_songs
  has_many :songs, through: :playlist_songs, source: :song

  validates :name, presence: true, uniqueness: { scope: [:author] }
  validates :author, presence: true, uniqueness: true
end

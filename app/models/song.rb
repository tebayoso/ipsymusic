# frozen_string_literal: true

class Song < ApplicationRecord
  belongs_to :author, polymorphic: true
  has_many :album_songs
  has_many :albums, through: :album_songs, source: :album

  has_many :playlist_songs
  has_many :playlist, through: :playlist_songs, source: :playlist

  validates :name, presence: true, uniqueness: { scope: %i[author duration date] }
end

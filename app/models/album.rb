# frozen_string_literal: true

class Album < ApplicationRecord
  belongs_to :author, polymorphic: true
  has_many :album_songs
  has_many :songs, through: :album_songs, source: :song

  validates :name, presence: true, uniqueness: { scope: %i[author] }
end

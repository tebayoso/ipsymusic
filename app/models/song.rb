# frozen_string_literal: true

class Song < ApplicationRecord
  belongs_to :author, polymorphic: true

  validates :name, presence: true, uniqueness: { scope: %i[author duration date] }
end

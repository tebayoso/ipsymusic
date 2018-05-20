# frozen_string_literal: true

class Album < ApplicationRecord
  belongs_to :author, polymorphic: true
  validates :name, presence: true, uniqueness: { scope: %i[author] }
end

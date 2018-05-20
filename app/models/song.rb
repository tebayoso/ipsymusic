class Song < ApplicationRecord
  belongs_to :author, polymorphic: true
end

class Album < ApplicationRecord
  belongs_to :author, polymorphic: true
end

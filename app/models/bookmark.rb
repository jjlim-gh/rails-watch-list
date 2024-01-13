class Bookmark < ApplicationRecord
  validates :comment, length: { minimum: 6 }
  belongs_to :movie
  belongs_to :list
  validates_associated :list, :movie
  validates :movie, uniqueness: { scope: :list }
end

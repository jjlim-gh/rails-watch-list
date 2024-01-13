class Movie < ApplicationRecord
  validates :title, :overview, presence: true, uniqueness: true
  has_many :bookmarks
  validates_associated :bookmarks
end

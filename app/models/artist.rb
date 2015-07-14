class Artist < ActiveRecord::Base
  has_many :songs
  has_many :artist_albums
  has_many :albums, through: :artist_albums

  validates :name, presence: true
end

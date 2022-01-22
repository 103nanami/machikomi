class Spot < ApplicationRecord

  belongs_to :post

  geocoded_by :post
  after_validation :geocode
end

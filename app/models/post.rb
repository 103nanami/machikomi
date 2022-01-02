class Post < ApplicationRecord

  belongs_to :users, dependent:destroy
  belongs_to :cities, dependent:destroy
  has_one :spots
  attachment :image
end

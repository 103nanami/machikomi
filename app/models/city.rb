class City < ApplicationRecord
  
  has_many :posts, dependent: :destroy
  has_one :column
end

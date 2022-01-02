class Column < ApplicationRecord

  belongs_to :cities

  attachment :image
end

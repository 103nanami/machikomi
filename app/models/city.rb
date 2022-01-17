class City < ApplicationRecord

  belongs_to :post, optional: true
  has_one :columns
end

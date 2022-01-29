class ColumnFavorite < ApplicationRecord
  
  belongs_to :user
  belongs_to :column
  
end

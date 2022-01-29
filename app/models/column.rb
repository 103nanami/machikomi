class Column < ApplicationRecord

  belongs_to :city
  has_many :column_favorites, dependent: :destroy
  attachment :image

  def favorited_by?(user)
    column_favorites.where(user_id: user.id).exists?
  end

  def self.search(search)
    if search
      Column.where(['text LIKE ?', "%#{search}%"]).or(Column.where(['title LIKE ?', "%#{search}%"]))
    else
      Column.all
    end
  end

  validates :title, presence: true
  validates :text, presence: true
  validates :image, presence: true
  validates :city_id, presence: true



end

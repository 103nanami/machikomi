class Post < ApplicationRecord

  belongs_to :user
  belongs_to :city, optional: true
  has_one :spot

  has_many :comments, dependent: :destroy
  has_many :post_favorites, dependent: :destroy

  attachment :image

  def favorited_by?(user)
    post_favorites.where(user_id: user.id).exists?
  end

  validates :post_name, presence: true
  validates :post_text, presence: true
  validates :image, presence: true
  validates :lat, presence: true
  validates :lng, presence: true
  validates :city_id, presence: true

end

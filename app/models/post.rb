class Post < ApplicationRecord

  #belongs_to :user, dependent:destroy
  #belongs_to :city, dependent:destroy
  #has_one :spot
  has_many :comments, dependent: :destroy
  has_many :favorites, dependent: :destroy

  def favorited_by?(user)
    favorites.where(user_id: user.id).exists?
  end

  attachment :image

end

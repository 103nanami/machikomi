class Post < ApplicationRecord

<<<<<<< HEAD
  belongs_to :user
  has_many :cities, dependent: :destroy
  has_one :spot
=======
  #belongs_to :user
  has_many :cities, dependent: :destroy
  #has_one :spot
>>>>>>> f9b25d0e1a77d6b87915d09e31f46eb9a58cca29
  has_many :comments, dependent: :destroy
  has_many :favorites, dependent: :destroy

  def favorited_by?(user)
    favorites.where(user_id: user.id).exists?
  end

  attachment :image

end

class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :posts, dependent: :destroy
  has_many :post_favorites, dependent: :destroy
  has_many :column_favorites, dependent: :destroy
  has_many :comments, dependent: :destroy

  attachment :image

  def active_for_authentication?
    super && (is_active == true)
  end

  def self.search(search)
    if search
      User.where(['last_name LIKE ?', "%#{search}%"]).or(User.where(['first_name LIKE ?', "%#{search}%"]))
    else
      User.all
    end
  end

end

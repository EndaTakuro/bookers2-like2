class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :books, dependent: :destroy
  has_many :favorites
  has_many :book_comments
  attachment :profile_image, destroy: false

  def favorited_by?(book_id)
    favorites.where(book_id: book_id).exists?
  end

  validates :name, length: {maximum: 20, minimum: 2}, uniqueness: true, presence: true
  validates :introduction, length: {maximum: 50}
end

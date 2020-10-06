class Favorite < ApplicationRecord
  has_many :favorite_posts, through: :favorites
end

class Food < ApplicationRecord
  belongs_to :user
  belongs_to :shop
  has_one_attached :image
end

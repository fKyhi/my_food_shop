class Food < ApplicationRecord
  belongs_to :user
  belongs_to :shop
  has_one_attached :image

  with_options presence: true do
    validates :image
    validates :name
    validates :explain
  end

end

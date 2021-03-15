class Shop < ApplicationRecord
  belongs_to :user
  has_one_attached :image

  with_options presence :true do
    validates :name
    validates :address
    validates :explain
  end

  
end

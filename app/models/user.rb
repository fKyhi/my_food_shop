class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :nickname, presence: true

  has_many :shops, dependent: :destroy
  has_many :foods, dependent: :destroy
end

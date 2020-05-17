class Recipe < ApplicationRecord

  belongs_to :user
  has_many :comments, dependent: :destroy
  has_many :likes, dependent: :destroy

  attachment :main_image

  has_many :ingredients, dependent: :destroy
  accepts_nested_attributes_for :ingredients

  has_many :makes, dependent: :destroy
  accepts_nested_attributes_for :makes

end

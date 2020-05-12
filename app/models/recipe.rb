class Recipe < ApplicationRecord

  belongs_to :user

  attachment :main_image

  has_many :ingredients, dependent: :destroy
  accepts_nested_attributes_for :ingredients, allow: true

  has_many :makes, dependent: :destroy
  accepts_nested_attributes_for :makes, allow: true

end

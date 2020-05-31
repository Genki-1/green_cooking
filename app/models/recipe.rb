class Recipe < ApplicationRecord

  belongs_to :user
  has_many :comments, dependent: :destroy
  has_many :likes, dependent: :destroy
  has_many :reports, dependent: :destroy

  attachment :main_image

  has_many :ingredients, dependent: :destroy
  accepts_nested_attributes_for :ingredients, allow_destroy: true

  has_many :makes, dependent: :destroy
  accepts_nested_attributes_for :makes, allow_destroy: true

  validates :main_image, presence: true
  validates :title, presence: true, length: { maximum: 20 }
  validates :description, presence: true, length: { maximum: 80 }
  validates :point, presence: true, length: { maximum: 100 }

end

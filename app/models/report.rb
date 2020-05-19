class Report < ApplicationRecord

  belongs_to :user
  belongs_to :recipe
  #バリデーション
  validates :content, presence: true
  validates :image, presence: true

  attachment :image


end

class Report < ApplicationRecord

  belongs_to :user
  belongs_to :recipe
  #バリデーション
  validates :content, presence: true, length: { maximum: 60 }
  validates :image, presence: true

  attachment :image


end

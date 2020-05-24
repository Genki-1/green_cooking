class Comment < ApplicationRecord

  belongs_to :user
  belongs_to :recipe
  #バリデーション
  validates :content, presence: true, length: { maximum: 300 }

end

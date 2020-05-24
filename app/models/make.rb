class Make < ApplicationRecord

  belongs_to :recipe

  attachment :image

  validates :process, presence: true, length: { maximum: 60 }

end

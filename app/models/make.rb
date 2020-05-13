class Make < ApplicationRecord

  belongs_to :recipe

  attachment :image

end

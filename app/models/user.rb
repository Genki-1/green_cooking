class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  def active_for_authentication?
    super && (self.is_member_status == false)
  end

  attachment :profile_image

  has_many :likes, dependent: :destroy
  has_many :like_recipes, through: :likes, source: :recipe

  has_many :recipes, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :reports, dependent: :destroy

  has_many :following_relationships, foreign_key: "follower_id", class_name: "Relationship",  dependent: :destroy
  has_many :following, through: :following_relationships
  has_many :follower_relationships, foreign_key: "following_id", class_name: "Relationship", dependent: :destroy
  has_many :followers, through: :follower_relationships

  validates :profile_text, length: { maximum: 80 }
  validates :nickname, presence: true, length: { maximum: 10 }


  #フォローしているかを確認するメソッド
  def following?(user)
    following_relationships.find_by(following_id: user.id)
  end

  #フォローするときのメソッド
  def follow(user)
    following_relationships.create!(following_id: user.id)
  end

  #フォローを外すときのメソッド
  def unfollow(user)
    following_relationships.find_by(following_id: user.id).destroy
  end

  def already_liked?(recipe)
   self.likes.exists?(recipe_id: recipe.id)
 end

end

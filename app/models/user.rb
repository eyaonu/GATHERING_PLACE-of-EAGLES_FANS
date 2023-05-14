class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :posts
  has_many :comments
  has_many :comment_posts, through: :comments, source: :post
  has_many :bookmarks
  has_many :bookmark_posts, through: :bookmarks, source: :post
end
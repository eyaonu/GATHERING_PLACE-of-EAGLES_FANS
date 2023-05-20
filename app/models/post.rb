class Post < ApplicationRecord
  belongs_to :user
  has_many :post_tags, dependent: :destroy
  has_many :tags, through: :post_tags
  has_many :post_comments, dependent: :destroy
  has_many :favorites, dependent: :destroy

  def self.tag_looks(search, word)
    if search == "perfect_match"
      @posts = Post.joins(:tags).where("tags.name LIKE?","#{word}%")
    elsif search == "forward_match"
      @posts = Post.joins(:tags).where("tags.name LIKE?","#{word}%")
    elsif search == "backward_match"
      @posts = Post.joins(:tags).where("tags.name LIKE?","%#{word}")
    elsif search == "partial_match"
      @posts = Post.joins(:tags).where("tags.name LIKE?","%#{word}%")
    else
      @posts = Post.all
    end
    @posts.distinct
  end

  def self.looks(search, word)
    if search == "perfect_match"
      @posts = Post.where("title LIKE?","#{word}")
    elsif search == "forward_match"
      @posts = Post.where("title LIKE?","#{word}%")
    elsif search == "backward_match"
      @posts = Post.where("title LIKE?","%#{word}")
    elsif search == "partial_match"
      @posts = Post.where("title LIKE?","%#{word}%")
    else
      @posts = Post.all
    end
  end

  def favorited_by?(user)
    favorites.exists?(user_id: user.id)
  end
end
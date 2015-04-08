class Post < ActiveRecord::Base
  validates :user_id, presence: true
  validates :url, presence: true, uniqueness: true
  validates :name, presence: true
  validates :description, presence: true
  acts_as_votable

  belongs_to :user
  has_many :comments, as: :commentable

  require 'acts_as_votable'

  def number_of_votes
    votes_for.size
  end

  def name_of_user
    user.name
  end

  def user_photo
    user.photo.to_s
  end

  def voters
    get_upvotes.map { |vote| User.find(vote.voter_id) }
  end
end

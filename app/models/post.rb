class Post < ActiveRecord::Base
  validates :user_id, presence: true
  validates :url, presence: true
  validates :name, presence: true
  validates :description, presence: true
  acts_as_votable

  belongs_to :user
  has_many :comments, as: :commentable

  require 'acts_as_votable'
  
  def name_of_user
    user.name
  end
end

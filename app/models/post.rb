class Post < ActiveRecord::Base
  validates :user_id, presence: true
  validates :url, presence: true
  validates :name, presence: true
  validates :description, presence: true
  belongs_to :user
end

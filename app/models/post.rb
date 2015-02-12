class Post < ActiveRecord::Base
  validates :url, presence: true
  validates :name, presence: true
  validates :description, presence: true
  belongs_to :user
end

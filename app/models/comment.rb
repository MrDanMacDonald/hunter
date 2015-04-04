class Comment < ActiveRecord::Base
  validates :commentable_id, presence: true
  validates :commentable_type, presence: true
  validates :content, presence: true

  belongs_to :commentable, polymorphic: true
  belongs_to :user

  acts_as_tree order: 'created_at ASC'

  def commenter_name
    user.name
  end

  def commenter_photo
    user.photo
  end
end

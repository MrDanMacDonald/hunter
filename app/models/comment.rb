class Comment < ActiveRecord::Base
  belongs_to :commentable, polymorphic: true
  belongs_to :user
  acts_as_tree order: 'created_at DESC'

  def commenter_name
    user.name
  end
end

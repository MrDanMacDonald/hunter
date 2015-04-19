class UserDecorator < Draper::Decorator
  delegate_all
  def display_twitter_handle
    "@#{object.twitter_handle}"
  end
end

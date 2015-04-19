class AddWebsiteDisplayUrlAndTwitterProfileUrl < ActiveRecord::Migration
  def change
    add_column :users, :twitter_profile_url, :string
    add_column :users, :website_display_url, :string
  end
end

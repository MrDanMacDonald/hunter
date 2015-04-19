class AddWebsiteAndTwitterHandleToUsers < ActiveRecord::Migration
  def change
    add_column :users, :twitter_handle, :string
    add_column :users, :website, :string
  end
end

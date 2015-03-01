class AddUserAttributes < ActiveRecord::Migration
  def change
    add_column :users, :photo, :string
    add_column :users, :title, :string
  end
end

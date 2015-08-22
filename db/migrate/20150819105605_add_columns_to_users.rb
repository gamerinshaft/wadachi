class AddColumnsToUsers < ActiveRecord::Migration
  def change
    add_column :users, :provider, :string
    add_column :users, :uid, :string
    add_column :users, :github_token, :string
    add_column :users, :avatar_url, :string
    add_column :users, :nickname, :string
    add_column :users, :name, :string
    add_index :users, :uid,                unique: true
  end
end

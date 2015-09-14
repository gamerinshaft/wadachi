class AddUserIdToGithub < ActiveRecord::Migration
  def change
    add_reference :githubs, :user, index: true, foreign_key: true
  end
end

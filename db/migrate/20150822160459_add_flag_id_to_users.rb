class AddFlagIdToUsers < ActiveRecord::Migration
  def change
    add_reference :users, :flag, index: true
  end
end

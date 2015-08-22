class CreateFlags < ActiveRecord::Migration
  def change
    create_table :flags do |t|
      t.references :user, index: true
      t.boolean :show_users, default: true

      t.timestamps
    end
  end
end

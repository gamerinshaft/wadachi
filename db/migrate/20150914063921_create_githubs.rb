class CreateGithubs < ActiveRecord::Migration
  def change
    create_table :githubs do |t|
      t.string :token

      t.timestamps null: false
    end
  end
end

class CreatePasses < ActiveRecord::Migration
  def change
    create_table :passes do |t|
      t.references :user, index: true, foreign_key: true
      t.references :area, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end

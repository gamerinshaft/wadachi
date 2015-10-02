class CreateAchivements < ActiveRecord::Migration
  def change
    create_table :achivements do |t|
      t.string :name
      t.text :content
      t.integer :status
      t.references :user, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end

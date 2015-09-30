class CreateRepositories < ActiveRecord::Migration
  def change
    create_table :repositories do |t|
      t.string :name
      t.boolean :private
      t.string :svn_url
      t.string :size
      t.string :description
      t.references :github, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end

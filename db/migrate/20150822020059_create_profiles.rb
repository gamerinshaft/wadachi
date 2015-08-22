class CreateProfiles < ActiveRecord::Migration
  def change
    create_table :profiles do |t|
      t.text :bio, default: "初めまして、よろしくお願いします。"
      t.references :user, index: true

      t.timestamps
    end
  end
end

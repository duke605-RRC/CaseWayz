class CreateAbouts < ActiveRecord::Migration
  def change
    create_table :abouts do |t|
      t.string :title, null: false, limit: 150
      t.text :description, null: false

      t.timestamps null: false
    end
  end
end

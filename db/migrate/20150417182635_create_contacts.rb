class CreateContacts < ActiveRecord::Migration
  def change
    create_table :contacts do |t|
      t.text :description, null:false
      t.string :phone, null: false
      t.string :email, null: false
      t.text :address, null: false

      t.timestamps null: false
    end
  end
end

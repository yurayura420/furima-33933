class CreateAddresses < ActiveRecord::Migration[6.0]
  def change
    create_table :addresses do |t|
      t.string :address_number, null:false
      t.integer :area_id, null:false
      t.string :city, null:false
      t.string :house_number, null:false
      t.string :house_name
      t.string :phone_number
      t.references :order, foreign_key: true
      t.timestamps
    end
  end
end

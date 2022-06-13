class CreateBuyerAddresses < ActiveRecord::Migration[6.0]
  def change
    create_table :buyer_addresses do |t|
      t.string :address_number,   null: false
      t.integer :prefecture_id,   null: false
      t.string :city,   null: false
      t.string :banti,   null: false
      t.string :building_name
      t.string :phone_number,   null: false
      t.references :match, foreign_key: true
      t.timestamps
    end
  end
end

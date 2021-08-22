class CreateAddresses < ActiveRecord::Migration[6.0]
  def change
    create_table :addresses do |t|
      t.string :address_first_name, null: false
      t.string :address_family_name, null: false
      t.string :address_first_name_kana, null: false
      t.string :address_family_name_kana, null: false
      t.integer :post_code, null: false
      t.integer :prefecture_id, null: false
      t.string :city, null: false
      t.string :address_line, null: false
      t.string :building_name
      t.string :phone, null: false
      t.references :user, null: false, foreign_key: true
      t.timestamps
    end
  end
end

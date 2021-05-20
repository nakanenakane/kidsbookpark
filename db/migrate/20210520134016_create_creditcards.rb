class CreateCreditcards < ActiveRecord::Migration[6.0]
  def change
    create_table :creditcards do |t|
      t.string :customer_id, null: false
      t.string :card_id, null: false
      t.references :user, null: false,  unique: true, index: true
      t.timestamps
    end
  end
end

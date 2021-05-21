class CreateProfiles < ActiveRecord::Migration[6.0]
  def change
    create_table :profiles do |t|
      t.string :first_name,   null: false
      t.string :family_name,   null: false
      t.string :first_name_kana,   null: false
      t.string :family_name_kana,   null: false
      t.date :birthday
      t.string :introduction
      t.references :user, null: false, foreign_key: true
      t.timestamps
    end
  end
end
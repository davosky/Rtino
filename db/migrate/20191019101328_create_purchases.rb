class CreatePurchases < ActiveRecord::Migration[5.2]
  def change
    create_table :purchases do |t|
      t.integer :name
      t.references :location, foreign_key: true
      t.references :structure, foreign_key: true
      t.references :category, foreign_key: true
      t.string :request_person
      t.date :request_date
      t.date :purchase_approval_date
      t.string :purchase_approval_person
      t.date :purchase_date
      t.references :purchase_typology, foreign_key: true
      t.references :vendor, foreign_key: true
      t.decimal :amount
      t.date :delivery_date
      t.text :description
      t.date :installation_date

      t.timestamps
    end
  end
end

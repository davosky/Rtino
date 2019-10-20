class CreateVendors < ActiveRecord::Migration[5.2]
  def change
    create_table :vendors do |t|
      t.string :name
      t.string :vat_number
      t.string :address
      t.string :zip
      t.string :city
      t.string :state_province
      t.string :phone
      t.string :fax
      t.string :email
      t.string :pec

      t.timestamps
    end
  end
end

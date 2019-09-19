class CreateTransfers < ActiveRecord::Migration[5.2]
  def change
    create_table :transfers do |t|
      t.integer :name
      t.date :transfer_date
      t.time :departure
      t.string :start_point
      t.string :start_address
      t.time :arrival
      t.string :destination
      t.string :destination_address
      t.decimal :path_lenght
      t.references :transport, foreign_key: true
      t.text :note

      t.timestamps
    end
  end
end

class CreateReports < ActiveRecord::Migration[5.2]
  def change
    create_table :reports do |t|
      t.integer :name
      t.date :date
      t.references :location, foreign_key: true
      t.references :structure, foreign_key: true

      t.timestamps
    end
  end
end

class CreateAssistances < ActiveRecord::Migration[5.2]
  def change
    create_table :assistances do |t|
      t.integer :name
      t.references :report, foreign_key: true
      t.time :start_time
      t.time :end_time
      t.text :description
      t.text :note
      t.references :category, foreign_key: true
      t.references :office, foreign_key: true

      t.timestamps
    end
  end
end

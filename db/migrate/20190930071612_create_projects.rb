class CreateProjects < ActiveRecord::Migration[5.2]
  def change
    create_table :projects do |t|
      t.string :name
      t.date :start_date
      t.date :end_date
      t.references :project_typology, foreign_key: true
      t.integer :project_priority
      t.text :project_description
      t.references :location, foreign_key: true
      t.references :structure, foreign_key: true
      t.references :office, foreign_key: true
      t.references :project_status, foreign_key: true

      t.timestamps
    end
  end
end

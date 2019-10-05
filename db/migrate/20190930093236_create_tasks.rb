class CreateTasks < ActiveRecord::Migration[5.2]
  def change
    create_table :tasks do |t|
      t.string :name
      t.date :start_date
      t.date :end_date
      t.references :project, foreign_key: true
      t.text :description

      t.timestamps
    end
  end
end

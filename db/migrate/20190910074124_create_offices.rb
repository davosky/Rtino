class CreateOffices < ActiveRecord::Migration[5.2]
  def change
    create_table :offices do |t|
      t.string :name
      t.integer :position

      t.timestamps
    end
  end
end

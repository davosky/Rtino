# frozen_string_literal: true

class CreateTransports < ActiveRecord::Migration[5.2]
  def change
    create_table :transports do |t|
      t.string :name
      t.integer :position

      t.timestamps
    end
  end
end

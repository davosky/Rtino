class CreatePurchaseTypologies < ActiveRecord::Migration[5.2]
  def change
    create_table :purchase_typologies do |t|
      t.string :name
      t.integer :position

      t.timestamps
    end
  end
end

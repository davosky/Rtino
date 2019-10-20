class AddUserToPurchaseTypology < ActiveRecord::Migration[5.2]
  def change
    add_reference :purchase_typologies, :user, foreign_key: true
  end
end

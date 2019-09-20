class AddUserToStructures < ActiveRecord::Migration[5.2]
  def change
    add_reference :structures, :user, foreign_key: true
  end
end

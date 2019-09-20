class AddUserToOffices < ActiveRecord::Migration[5.2]
  def change
    add_reference :offices, :user, foreign_key: true
  end
end

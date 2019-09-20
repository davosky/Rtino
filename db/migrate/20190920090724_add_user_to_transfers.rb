class AddUserToTransfers < ActiveRecord::Migration[5.2]
  def change
    add_reference :transfers, :user, foreign_key: true
  end
end

class AddUserToVendor < ActiveRecord::Migration[5.2]
  def change
    add_reference :vendors, :user, foreign_key: true
  end
end

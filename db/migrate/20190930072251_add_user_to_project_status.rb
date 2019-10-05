class AddUserToProjectStatus < ActiveRecord::Migration[5.2]
  def change
    add_reference :project_statuses, :user, foreign_key: true
  end
end

class AddUserToProjectTypology < ActiveRecord::Migration[5.2]
  def change
    add_reference :project_typologies, :user, foreign_key: true
  end
end

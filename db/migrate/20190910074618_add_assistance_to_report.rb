class AddAssistanceToReport < ActiveRecord::Migration[5.2]
  def change
    add_reference :reports, :assistance, foreign_key: true
  end
end

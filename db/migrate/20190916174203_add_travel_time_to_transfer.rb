class AddTravelTimeToTransfer < ActiveRecord::Migration[5.2]
  def change
    add_column :transfers, :travel_time, :time
  end
end

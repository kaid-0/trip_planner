class AddTripIdToRestaurants < ActiveRecord::Migration[7.1]
  def change
    add_column :restaurants, :trip_id, :int
  end
end

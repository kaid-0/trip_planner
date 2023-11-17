class AddTripIdToHotels < ActiveRecord::Migration[7.1]
  def change
    add_column :hotels, :trip_id, :int
  end
end

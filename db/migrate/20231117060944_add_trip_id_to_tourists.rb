class AddTripIdToTourists < ActiveRecord::Migration[7.1]
  def change
    add_column :tourists, :trip_id, :int
  end
end

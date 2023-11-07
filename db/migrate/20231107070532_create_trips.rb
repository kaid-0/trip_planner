class CreateTrips < ActiveRecord::Migration[7.1]
  def change
    create_table :trips do |t|

      t.integer :user_id
      t.string :city
      t.date :from_date
      t.date :end_date
      t.integer :head_count

      t.timestamps
    end
  end
end

class CreateTrips < ActiveRecord::Migration[7.1]
  def change
    create_table :trips do |t|

      t.belongs_to :user, index: true, foreign_key: true
      t.string :city
      t.date :from_date
      t.date :end_date
      t.integer :head_count

      t.timestamps
    end
  end
end

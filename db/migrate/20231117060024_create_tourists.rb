class CreateTourists < ActiveRecord::Migration[7.1]
  def change
    create_table :tourists do |t|
      t.text :name

      t.timestamps
    end
  end
end

class CreateUsers < ActiveRecord::Migration[7.1]
  def change
    create_table :users do |t|
      t.string :email
      t.string :password_digest
      t.text :first_name
      t.text :last_name
      t.text :phone

      t.timestamps
    end
  end
end

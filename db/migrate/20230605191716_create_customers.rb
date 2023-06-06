class CreateCustomers < ActiveRecord::Migration[6.1]
  def change
    create_table :customers do |t|
      t.string :first_name
      t.string :last_name
      t.integer :passport
      t.integer :phone_number
      t.string :mode_of_payment
      t.string :departure_info
    end
  end
end

class CreateBuses < ActiveRecord::Migration[6.1]
  def change
    create_table :buses do |t|
      t.integer :bus_number
      t.string :departure_city
      t.string :destination_city
      t.datetime :departure
      t.datetime :arrival
      t.integer :available_seats
      t.integer :fare
    end
  end
end

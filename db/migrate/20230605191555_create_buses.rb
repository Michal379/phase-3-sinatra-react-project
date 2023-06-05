class CreateBuses < ActiveRecord::Migration[6.1]
  def change
    create_table :buses do |t|
      t.integer :bus_number
      t.string :departure_city
      t.string :destination_city
      t.integer :departure_time
      t.integer :arrival_time
      t.integer :available_seats
      t.integer :fare
    end
  end
end

class CreateTrains < ActiveRecord::Migration[6.1]
  def change
    create_table :trains do |t|
      t.integer :train_number
      t.string :departure_city
      t.string :destination_city
      t.datetime :departure
      t.datetime :arrival
      t.integer :available_seats
      t.integer :fare
    end
  end
end

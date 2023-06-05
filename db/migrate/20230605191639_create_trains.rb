class CreateTrains < ActiveRecord::Migration[6.1]
  def change
    create_table :trains do |t|
      t.integer :train_number
      t.string :departure_city
      t.string :destination_city
      t.integer :departure_time
      t.integer :arrival_time
      t.integer :available_seats
      t.integer :fare
    end
  end
end

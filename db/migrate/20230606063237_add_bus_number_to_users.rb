class AddBusNumberToUsers < ActiveRecord::Migration[6.1]
  def change
    add_column :customers,  :bus_number_id, :integer
  end
end

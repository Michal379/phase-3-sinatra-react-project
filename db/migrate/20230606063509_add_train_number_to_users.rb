class AddTrainNumberToUsers < ActiveRecord::Migration[6.1]
  def change
    add_column :customers, :train_number_id, :integer
  end
end

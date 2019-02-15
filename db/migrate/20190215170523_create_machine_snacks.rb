class CreateMachineSnacks < ActiveRecord::Migration[5.1]
  def change
    create_table :machine_snacks do |t|
      t.integer :quantity
      t.integer :machine_id
      t.integer :snack_id
    end
  end
end

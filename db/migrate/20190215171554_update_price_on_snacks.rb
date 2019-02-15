class UpdatePriceOnSnacks < ActiveRecord::Migration[5.1]
  def change
    remove_column :snacks, :price
    add_column :snacks, :price, :float
  end
end

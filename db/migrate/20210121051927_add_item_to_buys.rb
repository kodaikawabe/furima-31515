class AddItemToBuys < ActiveRecord::Migration[6.0]
  def change
    add_reference :buys, :item, null: false, foreign_key: true
  end
end

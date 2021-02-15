class AddUserToBuys < ActiveRecord::Migration[6.0]
  def change
    add_reference :buys, :user, null: false, foreign_key: true
  end
end

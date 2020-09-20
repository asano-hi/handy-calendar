class AddPaymentToUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :payment, :integer
  end
end

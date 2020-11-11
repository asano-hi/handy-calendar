class AddPaymentToJobs < ActiveRecord::Migration[6.0]
  def change
    add_column :jobs, :payment, :integer
  end
end

class RemoveUserIdFromJobs < ActiveRecord::Migration[6.0]
  def change
    remove_column :jobs, :user_id, :integer
  end
end

class AddJobIdToSchedules < ActiveRecord::Migration[6.0]
  def change
    add_column :schedules, :job_id, :integer
  end
end

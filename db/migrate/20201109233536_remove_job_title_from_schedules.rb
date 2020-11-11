class RemoveJobTitleFromSchedules < ActiveRecord::Migration[6.0]
  def change
    remove_column :schedules, :job_title, :string
  end
end

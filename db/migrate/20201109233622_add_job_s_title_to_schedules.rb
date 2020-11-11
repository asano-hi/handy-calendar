class AddJobSTitleToSchedules < ActiveRecord::Migration[6.0]
  def change
    add_column :schedules, :job_s_title, :string
  end
end

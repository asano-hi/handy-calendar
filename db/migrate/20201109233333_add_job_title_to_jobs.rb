class AddJobTitleToJobs < ActiveRecord::Migration[6.0]
  def change
    add_column :jobs, :job_title, :string
  end
end

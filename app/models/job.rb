class Job < ApplicationRecord
  belongs_to :user
  belongs_to :schedules
end

class Job < ApplicationRecord

  validates :job_title, uniqueness: true

  belongs_to :user
end

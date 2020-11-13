class Job < ApplicationRecord

  validates :event_title, uniqueness: true

  belongs_to :user
end

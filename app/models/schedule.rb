class Schedule < ApplicationRecord

  validates :event_title, presence: true

  belongs_to :user
end

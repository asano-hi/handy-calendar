class Schedule < ApplicationRecord

  validates :event_title, presence: true

  belongs_to :user
  has_many :jobs

end

class Task::Session < ApplicationRecord

  belongs_to :task

  scope :active, -> { where(end_at: nil) }

end

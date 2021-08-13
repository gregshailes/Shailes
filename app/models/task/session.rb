class Task::Session < ApplicationRecord

  belongs_to :task

  scope :active, -> { where(end_at: nil) }

  def duration
    if end_at.nil?
      Time.current - created_at
    else
      end_at - created_at
    end
  end

end

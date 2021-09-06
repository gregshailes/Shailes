class Task::Session < ApplicationRecord

  belongs_to :task
  validate :cannot_multi_task

  scope :active, -> { where(end_at: nil) }

  def duration
    if end_at.nil?
      Time.current - created_at
    else
      end_at - created_at
    end
  end


  private
  

  def cannot_multi_task
    if self.new_record? && task.sessions.active.any?
      errors.add(:end_at, 'you cannot multi-task')
    end
  end

end

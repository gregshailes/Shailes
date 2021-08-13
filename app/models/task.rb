class Task < ApplicationRecord

  belongs_to :task_owner, polymorphic: true
  has_many :sessions, dependent: :destroy

  scope :for_owner, -> (owner) { where(task_owner: owner) }

  enum status: [ :in_progress,
                 :complete ]

  scope :in_progress, -> { where(status: :in_progress) }
  scope :complete, -> { where(status: :complete) }

  scope :active, -> { in_progress.joins(:sessions).where(sessions: { end_at: nil }) }
  scope :inactive, -> { in_progress - active }

  def active?
    self.sessions.where(end_at: nil).any?
  end

  def start_work
    stop_work
    self.sessions.create(start_at: Time.current)
  end

  def stop_work
    sessions.active.update_all(end_at: Time.current)
  end

end

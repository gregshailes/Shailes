class TasksController < ApplicationController

  before_action :authenticate_user!

  helper_method :task, :tasks, :active_task, :archived_tasks

  respond_to :html

  layout 'tasks'

  def new; end

  def create
    task.update(task_params)
    if task.valid?
      tasks.active.each(&:stop_work)
      task.save!
      task.start_work
      render :index
    else
      render :new
    end
  end

  def edit; end

  def update
    task.update(task_params)
    if task.valid?
      task.save
      render :index
    else
      render :edit
    end

  end

  def start_work
    task.start_work
    render :index
  end

  def stop_work
    tasks.active.each(&:stop_work)
    render :index
  end

  def complete
    task.stop_work if task.active?
    task.complete!
    render :index
  end

  def archive; end

  private

  def task
    @task ||= params[:id].present? ? Task.find(params[:id]) : Task.new(task_owner: current_user)
  end

  def tasks
    @tasks ||= Task.for_owner(current_user).order(name: :asc).in_progress
  end

  def active_task
    @active_task ||= tasks.active.first
  end

  def archived_tasks
    @archived_tasks ||= Task.for_owner(current_user).order(name: :asc).complete
  end

  def task_params
    params.require(:task).permit(:name)
  end

end

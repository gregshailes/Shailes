class TasksController < ApplicationController

  before_action :authenticate_user!
  before_action :set_new_task, only: [:new, :create]
  before_action :set_tasks, only: [:index, :create, :start_work, :stop_work, :complete]

  respond_to :html

  layout 'tasks'

  def new; end

  def create
    @new_task.update(new_task_params)
    if @new_task.valid?
      @tasks.active.each(&:stop_work)
      @new_task.sessions << Task::Session.new
      @new_task.save!
      @new_task.start_work
      redirect_to(tasks_path)
    else
      render :new
    end
  end

  def start_work
    @tasks.find(start_work_params[:task_id]).start_work
    redirect_to(tasks_path)
  end

  def stop_work
    @tasks.active.each(&:stop_work)
    redirect_to(tasks_path)
  end

  def complete
    task = @tasks.in_progress.find(complete_task_params[:task_id])
    task.stop_work if task.active?
    task.complete!
    redirect_to(tasks_path)
  end

  def archive
    @archived_tasks = Task.for_owner(current_user).order(name: :asc).complete
  end


  private


  def set_new_task
    @new_task = Task.new(task_owner: current_user)
  end

  def set_tasks
    @tasks = Task.for_owner(current_user).order(name: :asc).in_progress
    @active_task = @tasks.active.first
  end

  def start_work_params
    params.permit(:task_id)
  end

  def new_task_params
    params.require(:task).permit(:name)
  end

  def complete_task_params
    params.permit(:task_id)
  end

end

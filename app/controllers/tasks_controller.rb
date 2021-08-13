class TasksController < ApplicationController

  before_action :authenticate_user!
  before_action :set_tasks, only: [:index, :create, :start_work, :stop_work, :complete]

  respond_to :html

  layout 'tasks'


  def create
    @new_task = Task.new(new_task_params.merge(task_owner: current_user))
    if @new_task.valid?
      @tasks.active.each(&:stop_work)
      @new_task.sessions << Task::Session.new(start_at: Time.current)
      @new_task.save!
      redirect_to(tasks_path)
    else
      render :index
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


  private


  def set_tasks
    @new_task = Task.new(task_owner: current_user)
    @tasks = Task.for_owner(current_user).order(name: :asc)
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

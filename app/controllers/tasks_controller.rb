class TasksController < ApplicationController
  before_action :set_task, only: [:show, :edit, :update, :destroy]

  def index
    @tasks = Task.all
  end

  def show
  end

  def new
    @task = Task.new
  end

  def create
    @task = Task.new(task_params)
    @task.save
    redirect_to task_path(@task)
  end

  def edit
  end

  def update
    @task.update(task_params)
    redirect_to task_path(@task)
  end

  def destroy
    @task.destroy
    redirect_to tasks_path, status: :see_other
  end

  def complete
    @task = current_user.tasks.find(params[:id])
    @task.completed = true
    @task.save
    redirect_to task_path(@task)
  end

  def incomplete
   @task = current_user.tasks.find(params[:id])
   @task.completed = false
   @task.save
   redirect_to task_path(@task)
 end
  private

  def task_params
    params.require(:task).permit(:title, :details, :completed)
  end

  def set_task
    @task = Task.find(params[:id])
  end
end

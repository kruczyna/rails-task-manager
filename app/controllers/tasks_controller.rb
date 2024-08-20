class TasksController < ApplicationController

  def index
    @tasks = Task.all
  end

  def show
    @task = Task.find(params[:id])
  end

  def new
    @task = Task.new
  end

  def create
    @task = Task.new(tasks_params)
    @task.save

    redirect_to show_path(@task)
  end

  private

  def tasks_params
    # Will below will raise ActiveModel::ForbiddenAttributesError
    params.require(:task).permit(:title, :details, :completed)
  end
end

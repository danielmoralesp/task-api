class TasksController < ApplicationController
  def index
    tasks = Task.all
    render json: tasks
  end

  def create
    task = Task.new(task_params)
    task.user = current_user

    if task.save
      render json: task
    else
      render json: { errors: task.errors }, status: 422
    end
  end

  def destroy
    task = Task.find(params[:id])
    task.destroy

    head :no_content
  end

  private
    def task_params
      params.require(:task).permit(:title, :done)
    end
end

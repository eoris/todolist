class TasksController < ApplicationController
  def index
  end

  def create
    @project = Project.find(params[:project_id])
    @task = @project.task.create(task_params)
  end

  private
    def task_params
      params.require(:task).permit(:title, :date)
    end
end

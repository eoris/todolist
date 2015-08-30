class TasksController < ApplicationController
  def index
  end

  def create
    @project = Project.find(params[:project_id])
    @task = Task.new(task_params)

    respond_to do |format|
      if @task.save
        format.js   {}
      else
        format.js   {render 'index'}
      end
    end
  end

  private
    def task_params
      params.require(:task).permit(:title, :date)
    end
end

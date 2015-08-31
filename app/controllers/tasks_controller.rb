class TasksController < ApplicationController

  def create
    @project = Project.find(params[:project_id])
    @task = @project.tasks.create(task_params)

    respond_to do |format|
      if @task.save
        format.js   {}
      else
        format.js   {render nothing: true}
      end
    end
  end

  def destroy
    @project = Project.find(params[:project_id])
    @task = @project.tasks.find(params[:id])
    @task.destroy
  end

  def update
    # @project = Project.find(params[:id])
    # @task = @project.tasks.find
    @task = Task.find(params[:id])
    respond_to do |format|

      if @task.update(task_params)
        format.js   {}
      else
        format.js   {render nothing: true}
      end
    end
  end

  private
    def task_params
      params.require(:task).permit(:title, :date)
    end
end

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

  private
    def task_params
      params.require(:task).permit(:title, :date)
    end
end

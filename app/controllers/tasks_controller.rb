class TasksController < ApplicationController

  def create
    @project = Project.find(params[:project_id])
    # @task = Task.new(task_params)

    @task = @project.tasks.create(task_params)

    respond_to do |format|
      if @task.save
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

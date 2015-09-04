class TasksController < ApplicationController

  def create
    @project = Project.find(params[:project_id])
    @task = @project.tasks.create(task_params)
    respond_to do |format|
      if @task.save
        format.js  {}
      else
        format.js  {render nothing: true}
      end
    end
  end

  def destroy
    @project = Project.find(params[:project_id])
    @task = @project.tasks.find(params[:id])
    @task.destroy
  end

  def update
    @project = Project.find(params[:project_id])
    @task = Task.find(params[:id])
    respond_to do |format|
      if @task.update(task_params)
        format.js  {}
      else
        format.js  {render nothing: true}
      end
    end
  end

  def sort
    params[:task].each_with_index do |id, index|
    Task.where(id: id).update_all({position: index+1})
    end
    render nothing: true
  end

  private
    def task_params
      params.require(:task).permit(:title, :date, :position, :done)
    end
end
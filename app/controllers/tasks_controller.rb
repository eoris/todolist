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

  # def sort
  #   @task = Task.find(params[:id])
  #   @task.position = params[:position].to_i -1
  #   respond_to do |format|
  #     if @task.save
  #       format.js {}
  #     else
  #       format.js {}
  #     end
  #   end
  # end

  # def sort
  #   params[:task].each_with_index do |id, index|
  #    Task.where(id: id).update_all({position: index+1})
  #   end
  #   render nothing: true
  # end

def sort
    params[:task].each_with_index do |id, index|
        task = Task.find(id)
        task.update_all(:position, index) if task
    end
    render nothing: true
end



  private
    def task_params
      params.require(:task).permit(:title, :date, :position)
    end
end

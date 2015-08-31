class ProjectsController < ApplicationController

  def index
    @project  = Project.new
    @projects = Project.all
  end

  def create
    @project = Project.new(project_params)
    respond_to do |format|
      
      if @result = @project.save
        format.js   {}
      else
        format.js   {render nothing: true} 
      end
    end
  end

  def update
    @project = Project.find(params[:id])
    respond_to do |format|

      if @project.update(project_params)
        format.js   {}
      else
        format.js   {render nothing: true}
      end
    end
  end

  def destroy
    @project = Project.find(params[:id])
    @project.destroy
  end


  private
    def project_params
      params.require(:project).permit(:title)      
    end

end
class ProjectsController < ApplicationController

  before_filter :authenticate_user!

  def index
    @projects = current_user.projects
    @project  = Project.new
    # @projects = Project.all
  end

  def create
    @project = current_user.projects.new(project_params)
    @projects = current_user.projects
    # @project = Project.new(project_params)
    respond_to do |format|
      if @project.save
        format.js  {}
      else
        format.js  {render nothing: true}
      end
    end
  end

  def update
    @project = current_user.projects.find(params[:id])
    @projects = current_user.projects
    # @project = Project.find(params[:id])
    respond_to do |format|
      if @project.update(project_params)
        format.js  {}
      else
        format.js  {render nothing: true}
      end
    end
  end

  def destroy
    @project = current_user.projects.find(params[:id])
    @project.destroy
  end


  private
    def project_params
      params.require(:project).permit(:title)
    end

end
class ProjectsController < ApplicationController

  def index
    @project  = Project.new
    @projects = Project.all
  end

  def create
    @project = Project.new(project_params)
    # byebug
    respond_to do |format|
      if @project.save
        format.html { redirect_to @project, notice: 'Project was successfully created.' }
        format.js   {}
        format.json { render json: @project, status: :created, location: @project }
      else
        format.html { render action: "new" }
        format.json { render json: @project.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @project = Project.find(params[:id])
    @project.destroy
    redirect_to @project
  end


  private
    def project_params
      params.require(:project).permit(:title)      
    end

end
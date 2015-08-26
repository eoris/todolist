class ProjectsController < ApplicationController

  def index
    @project = Project.new
    @projects = Project.all
  end

  def show
    # @project = Project.find(params[:id])   
  end

  def new
    # @project = Project.new    
  end

  def edit
    # @project = Project.find(params[:id])
  end

  def create
    @project = Project.new(project_params)
    @project.save
    respond_to do |format|
      format.html { redirect_to @project }
      format.js
    end
  end

  def update
    # @project = Project.find(params[:id])

    #   if @project.update(project_params)
    #     redirect_to @project
    #   else
    #     render 'edit'
    # end    
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
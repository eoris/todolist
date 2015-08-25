class ProjectsController < ApplicationController

  def index
    @project = Project.new
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
    # @project = Project.new(project_params)

    # respond_to do |format|
    #   if @project.save
    #     format.html { redirect_to @project, notice: 'Project was successfully created.' }
        
    #   else
    #     format.html { render :new }
        
    #   end
    # end
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
    # @project = Project.find(params[:id])
    # @project.destroy   
    # redirect_to projects_path
  end


  private
    def project_params
      params.require(:project).permit(:title)      
    end

end
class ProjectsController < ApplicationController
  def index
    @projects = Project.all
  end
  
  def create
    @project = Project.new(params[:project])
    @project.save
    flash[:notice] = "Project created."
    redirect_to(project_pages_url(@project))
  end
  
  def destroy
    @project = Project.find(params[:id])
    @project.destroy
    flash[:notice] = "Project deleted."
    redirect_to(projects_url)
  end
end

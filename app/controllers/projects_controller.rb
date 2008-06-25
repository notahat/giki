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
  
  def pull
    @project = Project.find(params[:id])
    @remote = params[:remote]
    @project.git.fetch(@remote)
    @project.git.merge("#{@remote}/master")
    flash[:notice] = "Pull completed."
    redirect_to(project_pages_url(@project))
  end
  
  def push
    @project = Project.find(params[:id])
    @remote = params[:remote]
    @project.git.push(@remote)
    flash[:notice] = "Push completed."
    redirect_to(project_pages_url(@project))
  end
end

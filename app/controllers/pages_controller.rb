class PagesController < ApplicationController
  before_filter :find_project
  
  def index
    @pages = @project.pages.all
  end
  
  def show
    @page = @project.pages.find(params[:id])
  end
  
  def new
    @page = @project.pages.build(params[:page])
    render(:action => "edit")
  end
  
  def create
    @page = @project.pages.create(params[:page])
    flash[:notice] = "Page created."
    redirect_to([@project, @page])
  end
  
  def edit
    @page = @project.pages.find(params[:id])
  end
  
  def update
    @page = @project.pages.find(params[:id])
    @page.update_attributes(params[:page])
    flash[:notice] = "Page saved."
    redirect_to([@project, @page])
  end
  
private

  def find_project
    @project = Project.find(params[:project_id])
  end
  
end

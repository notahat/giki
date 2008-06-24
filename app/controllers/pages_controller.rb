class PagesController < ApplicationController
  before_filter :find_project
  
  def index
    @pages = @project.pages.all
  end
  
  def show
    @page = @project.pages.find(params[:id])
  end
  
  def create
    @page = @project.pages.build(params[:page])
    @page.save
    flash[:notice] = "Page created."
    redirect_to(edit_project_page_url(@project, @page))
  end
  
  def edit
    @page = @project.pages.find(params[:id])
  end
  
  def update
    @page = @project.pages.find(params[:id])
    @page.body = params[:page][:body]
    @page.save
    flash[:notice] = "Page saved."
    redirect_to([@project, @page])
  end
  
  def find_project
    @project = Project.find(params[:project_id])
  end
end

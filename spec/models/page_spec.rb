require File.dirname(__FILE__) + '/../spec_helper'

describe Page do
  before do
    clear_projects
    create_test_project
  end
  
  it "should create a page" do
    create_test_page
    @project.pages.all.length.should == 1
    @page.path.should == "#{Project.projects_root}/test_project/test_page.markdown"
    File.exist?(@page.path).should be_true
  end
  
  def create_test_page
    @page = @project.pages.build(:name => "test_page")
    @page.save
  end
end

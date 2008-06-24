require File.dirname(__FILE__) + '/../spec_helper'

describe Page do
  before do
    clear_projects
    create_test_project
  end
  
  describe "creating a page" do
    before do
      create_test_page
    end
    
    it "should give the correct path for the page" do
      @page.path.should == "#{Project.projects_root}/test_project/test_page.markdown"
    end
    
    it "should create a file for the page" do
      File.exist?(@page.path).should be_true
    end
    
    it "should set the contents of the page file correctly" do
      File.read(@page.path).should == "just a test"
    end
  end
  
  def create_test_page
    @page = @project.pages.create(:name => "test_page", :body => "just a test", :commit_message => "added test_page")
  end
end

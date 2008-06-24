require File.dirname(__FILE__) + '/../spec_helper'

describe Project do
  before do
    clear_projects
    create_test_project
  end
  
  it "should create a project" do
    Project.all.length.should == 1
    @project.path.should == "#{Project.projects_root}/test_project"
    File.exist?(@project.path).should be_true
    File.exist?("#{@project.path}/.git").should be_true
  end
  
  it "should destroy a project" do
    @project.destroy
    Project.all.should be_empty
    File.exist?(@project.path).should be_false
  end
  
  it "should find a project" do
    Project.find("test_project").should == @project
  end
end

require File.dirname(__FILE__) + '/../spec_helper'

describe Project do
  before do
    clear_projects
  end
  
  it "should create a project" do
    create_test_project
    Project.all.length.should == 1
    @project.path.should == "#{Project.projects_root}/test_project"
    File.exist?(@project.path).should be_true
    File.exist?("#{@project.path}/.git").should be_true
  end
end

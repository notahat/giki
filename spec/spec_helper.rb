# This file is copied to ~/spec when you run 'ruby script/generate rspec'
# from the project root directory.
ENV["RAILS_ENV"] = "test"
require File.expand_path(File.dirname(__FILE__) + "/../config/environment")
require 'spec'
require 'spec/rails'

Spec::Runner.configure do |config|
  def clear_projects
    `rm -rf #{Project.projects_root}`
  end
  
  def create_test_project
    @project = Project.new(:name => "test_project")
    @project.save
  end
end

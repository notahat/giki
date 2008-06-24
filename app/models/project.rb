require 'git'

class Project
  def self.all
    Dir.glob("#{projects_root}/*").map do |path|
      Project.new(:name => File.basename(path))
    end
  end
  
  def self.find(name)
    Project.new(:name => name)
  end
  
  def initialize(params = {})
    @name = params[:name]
  end

  attr_reader :name
  alias_method :to_param, :name
  
  def pages
    @pages ||= PagesAssociation.new(self)
  end
    
  def save
    if new_record?
      Dir.mkdir(self.class.projects_root) unless File.exist?(self.class.projects_root)
      Dir.mkdir(path) unless File.exist?(path)
      @git = Git.init(path)
      true
    end
  end
  
  def destroy
    `cd #{self.class.projects_root}; rm -rf #{@name}` unless new_record?
  end
  
  def new_record?
    @name.blank? || !File.exist?(path)
  end
  
  def git
    @git ||= Git.open(path)
  end
  
  def path
    "#{self.class.projects_root}/#{@name}"
  end
  
  def self.projects_root
    "#{RAILS_ROOT}/db/projects/#{RAILS_ENV}"
  end
  
  def ==(project)
    project.name == @name
  end
end

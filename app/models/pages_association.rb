class PagesAssociation
  def initialize(project)
    @project = project
  end
  
  def all
    Dir.glob("#{@project.path}/*.markdown").map do |path|
      Page.new(:project => @project, :name => File.basename(path, ".markdown"))
    end
  end
  
  def first
    all.first
  end
  
  def find(name)
    Page.new(:project => @project, :name => name)
  end
  
  def build(params = {})
    Page.new(params.merge(:project => @project))
  end
end

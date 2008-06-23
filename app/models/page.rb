class Page
  def initialize(params = {})
    @project = params[:project]
    @name    = params[:name]
  end
  
  attr_reader :project
  attr_reader :name
  attr_writer :body
  attr_accessor :change_message
  alias_method :to_param, :name
  
  def body
    @body ||= (new_record? ? '' : File.read(path))
  end
  
  def textmate_url
    "txmt://open?url=file://#{path}"
  end
  
  def save
    file = File.new(path, "w")
    file.write(@body)
    file.close
    @change_message = "-" if @change_message.blank?
    `cd #{@project.path}; git add #{path}; git commit #{path} -m '#{@change_message}'`
  end
  
  def new_record?
    !File.exist?(path)
  end
  
  def path
    "#{@project.path}/#{@name}.markdown"
  end
end

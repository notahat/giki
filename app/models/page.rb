require 'git'

class Page
  def initialize(attributes = nil)
    self.attributes = attributes
  end
  
  def attributes=(attributes = nil)
    attributes ||= {}
    attributes.each {|key, value| send("#{key}=", value) }
  end
  
  def update_attributes(attributes = nil)
    self.attributes = attributes
    save
  end
  
  attr_accessor :project
  attr_accessor :name
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
    @project.git.add(path)
    @project.git.commit(@change_message)
  end
  
  def new_record?
    name.blank? || !File.exist?(path)
  end
  
  def path
    "#{@project.path}/#{@name}.markdown"
  end
end

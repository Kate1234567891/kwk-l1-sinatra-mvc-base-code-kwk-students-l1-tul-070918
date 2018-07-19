class Idea 
  attr_reader :title, :description
  def initialize(title, description)
    @title = title
    @description = description
end
  require 'yaml/store'
  
  def save
    database.transaction do |db|
      db['ideas'] ||=[]
      db['ideas'] << {title: title, description: description}
    end
end

def database
  @databse ||= YAML::Store.new "ideabox"
 end
 
end

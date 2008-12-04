$:.unshift File.dirname(__FILE__)

require 'rubygems'
require 'active_support'
# require ActiveSupport::OrderedHash

class Episodifier
  
  attr_accessor :show_name, :episode_id, :encoding, :encoding_group, :format, :release_group
  
  attr_accessor :original_name, :working_name
  cattr_accessor :filters
  
  @@encoding_groups = ["XviD-LOL"]
  @@encodings = ["HDTV"]
  
  @@filters = ActiveSupport::OrderedHash.new
  @@filters[:episode_id] = /\.(S\d{1,2}E\d{1,2})/
  @@filters[:format] = /\.([a-zA-Z0-9]+)$/
  @@filters[:encoding] = /\.(#{@@encodings.join('|')})/
  @@filters[:encoding_group] = /\.(#{@@encoding_groups.join('|')})/
  @@filters[:release_group] = /\.\[VTV\]/
  # Show name could be anything? so just gazzump the rest?
  @@filters[:show_name] = /(.*)/

  # Take in a file name and give us back all the tasty data.
  def initialize(file_name)
    
    @original_name = @working_name = file_name
    
    @@filters.each do |f|
      filter, regex = f[0], f[1]
      if @working_name =~ regex
        self.send("#{filter.to_s}=", @working_name.match(regex)[1])
        @working_name.gsub!(regex,"")
      end
    end
    
  end
  
  def fully_parsed?
    @working_name.empty?
  end
  
  
end
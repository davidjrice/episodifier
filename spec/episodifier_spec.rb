require File.dirname(__FILE__) + '/spec_helper'

describe Episodifier do
    
  describe "filters" do
  
    it "should be applied in order" do
      filters = []
      Episodifier.filters.each do |f|
        filter, regex = f[0], f[1]
        filters << filter
      end
      filters.should == [:episode_id, :format, :encoding, :encoding_group, :release_group, :show_name]
    end
  
    
  end
  
  should_parse_episode("Dexter.S03E08.HDTV.XviD-LOL.avi", 
    :show_name => "Dexter", :episode_id => "S03E08", 
    :encoding => "HDTV", :encoding_group => "XviD-LOL", :format => "avi")
    
  should_parse_episode("My.Name.is.Earl.S04E10.HDTV.XviD-LOL.[VTV].avi", 
    :show_name => "My.Name.is.Earl", :episode_id => "S04E10", 
    :encoding => "HDTV", :encoding_group => "XviD-LOL", :format => "avi")
  
  should_parse_episode "Chuck.S02E07.HDTV.XviD-E7.avi",
    :show_name => "Chuck", :episode_id => "S02E07", 
    :encoding => "HDTV", :encoding_group => "XviD-E7", :format => "avi"
  
end
# show.name.series_episode_id.encoding.encoding_group.release_group.format
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
  
  describe "given a file name of Dexter.S03E08.HDTV.XviD-LOL.avi" do
    
    before(:each) do
      @episodifier = Episodifier.new "Dexter.S03E08.HDTV.XviD-LOL.avi"
    end
    
    it "should parse the show name" do
      @episodifier.show_name.should == "Dexter"
    end
    
    it "should parse the episode_id" do
      @episodifier.episode_id.should == "S03E08"
    end
    
    it "should parse the encoding" do
      @episodifier.encoding.should == "HDTV"
    end
    
    it "should parse the encoding_group" do
      @episodifier.encoding_group.should == "XviD-LOL"
    end
    
    it "should parse the format" do
      @episodifier.format.should == "avi"
    end
    
    it "working name should be blank" do
      @episodifier.working_name.should == ""
    end
    
    it "should be fully parsed" do
      @episodifier.fully_parsed?.should be_true
    end
    
  end
  
  describe "given a file name of My.Name.is.Earl.S04E10.HDTV.XviD-LOL.[VTV].avi" do
    
    before(:each) do
      @episodifier = Episodifier.new "My.Name.is.Earl.S04E10.HDTV.XviD-LOL.[VTV].avi"
    end
    
    it "should parse the show name" do
      @episodifier.show_name.should == "My.Name.is.Earl"
    end
    
    it "should parse the episode_id" do
      @episodifier.episode_id.should == "S04E10"
    end
    
    it "should parse the encoding" do
      @episodifier.encoding.should == "HDTV"
    end
    
    it "should parse the encoding_group" do
      @episodifier.encoding_group.should == "XviD-LOL"
    end
    
    it "should parse the release group" do
      pending
    end
    
    it "should parse the format" do
      @episodifier.format.should == "avi"
    end
    
    it "working name should be blank" do
      @episodifier.working_name.should == ""
    end
    
    it "should be fully parsed" do
      @episodifier.fully_parsed?.should be_true
    end
    
  end
  
end
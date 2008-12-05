module Spec::Example::ExampleGroupMethods
    
  # Ensure that the belongs_to relationship exists.
  #
  #   it { should belong_to(:parent) }
  # # should_parse_episode 'filename', {attributes}
  def should_parse_episode(filename, attributes)
    klass = self.described_type
    subject = klass.new(filename)
    
    describe(filename) do
      attributes.each_key do |attr|
    
        it "should extract #{attr}: #{attributes[attr]}" do
          subject.send(attr).should == attributes[attr]
        end
      end
      
      it "working name should be blank" do
        subject.working_name.should == ""
      end

      it "should be fully parsed" do
        subject.fully_parsed?.should be_true
      end
      
    end
  end
  
end



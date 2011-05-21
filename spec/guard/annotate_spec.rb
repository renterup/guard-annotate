require 'spec_helper'

describe Guard::Annotate do
  subject { Guard::Annotate.new }
  
  context "#initialize options" do
    describe "notify" do
      it "should be true by default" do
        subject.should be_notify
      end
      
      it "should be able to be set to false" do
        subject = Guard::Annotate.new( [], :notify => false )
        subject.options[:notify].should be_false
      end
    end
  end
  
  context "start" do
    it "should run annotate command" do
      subject.should_receive(:system).with("annotate")
      subject.start
    end
    
    it "should return false if annotate command fails" do
      subject.should_receive(:system).with("annotate").and_return(false)
      subject.start.should be_false
    end
  end
  
  context "stop" do
    it "should be a noop (return true)" do
      subject.stop.should be_true
    end
  end  
  
  context "run_all" do
    it "should be a noop (return true)" do
      subject.run_all.should be_true
    end
  end  
  
  context "reload" do
    it "should run annotate command" do
      subject.should_receive(:system).with("annotate")
      subject.reload
    end
    
    it "should return false if annotate command fails" do
      subject.should_receive(:system).with("annotate").and_return(false)
      subject.reload.should be_false
    end
  end
  
  context "run_on_change" do
    it "should run annotate command" do
      subject.should_receive(:system).with("annotate")
      subject.run_on_change
    end
    
    it "should return false if annotate command fails" do
      subject.should_receive(:system).with("annotate").and_return(false)
      subject.run_on_change.should be_false
    end
  end
end
require 'spec_helper'

describe DocketingPerspective do
  before(:each) do
    @perspective = Factory(:docketing_perspective)
  end

  context "validations" do
    it 'should save with valid properties' do
      @perspective.id.should_not be_nil
    end

    it 'should not save without a name' do
      @perspective.name = nil
      @perspective.save.should be_false
    end

    it 'should not save with a duplicate name' do
      duplicate = Factory.build( :docketing_perspective, :name => @perspective.name )
      duplicate.save.should be_false
    end
  end
end


require 'spec_helper'

describe Docket do

  before(:each) do
    @docket = Factory(:docket)
  end

  context "validations" do

    it 'should not save without a name' do
      @docket.name = nil
      @docket.save.should be_false
    end

    it 'should not save with a duplicate name' do
      duplicate = Factory.build(:docket, :name => @docket.name)
      duplicate.save.should be_false
    end

  end

end


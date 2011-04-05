require 'spec_helper'

describe DocketingDocket do

  before(:each) do
    @docket = Factory(:docketing_docket)
  end

  context "validations" do

    it 'should not save without a name' do
      @docket.name = nil
      @docket.save.should be_false
    end

    it 'should not save with a duplicate name' do
      duplicate = Factory.build(:docketing_docket, :name => @docket.name)
      duplicate.save.should be_false
    end

  end

end


require 'spec_helper'

describe Docket do

  def reset_docket(options = {})
    @valid_attributes = {
      :id => 1,
      :name => "RSpec is great for testing too"
    }

    @docket.destroy! if @docket
    @docket = Docket.create!(@valid_attributes.update(options))
  end

  before(:each) do
    reset_docket
  end

  context "validations" do
    
    it "rejects empty name" do
      Docket.new(@valid_attributes.merge(:name => "")).should_not be_valid
    end

    it "rejects non unique name" do
      # as one gets created before each spec by reset_docket
      Docket.new(@valid_attributes).should_not be_valid
    end
    
  end

end
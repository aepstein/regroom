require 'spec_helper'

describe DocketingItem do
  before(:each) do
    @item = Factory(:docketing_item)
  end

  context "validations" do
    it 'should save with valid properties' do
      @item.id.should_not be_nil
    end

    it 'should not save without a parent or title' do
      @item.parent = nil
      @item.title = nil
      @item.save.should be_false
    end

    it 'should not save with duplicate title for a docket' do
      duplicate = Factory.build( :docketing_item, :docket => @item.docket, :title => @item.title )
      duplicate.save.should be_false
    end

    it 'should not save without a status' do
      @item.status = nil
      @item.save.should be_false
    end

    it 'should not save without a perspective' do
      @item.perspective = nil
      @item.save.should be_false
    end

    it 'should not save without a creator' do
      @item.creator = nil
      @item.save.should be_false
    end

    it 'should not save with content' do
      @item.content = nil
      @item.save.should be_false
      @item.content = ""
      @item.save.should be_false
    end
  end
end


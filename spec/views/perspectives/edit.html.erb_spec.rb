require 'spec_helper'

describe "perspectives/edit.html.erb" do
  before(:each) do
    @perspective = assign(:perspective, stub_model(Perspective,
      :name => "MyString"
    ))
  end

  it "renders the edit perspective form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => perspectives_path(@perspective), :method => "post" do
      assert_select "input#perspective_name", :name => "perspective[name]"
    end
  end
end

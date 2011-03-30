require 'spec_helper'

describe "perspectives/new.html.erb" do
  before(:each) do
    assign(:perspective, stub_model(Perspective,
      :name => "MyString"
    ).as_new_record)
  end

  it "renders new perspective form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => perspectives_path, :method => "post" do
      assert_select "input#perspective_name", :name => "perspective[name]"
    end
  end
end

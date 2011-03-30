require 'spec_helper'

describe "perspectives/show.html.erb" do
  before(:each) do
    @perspective = assign(:perspective, stub_model(Perspective,
      :name => "Name"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Name/)
  end
end

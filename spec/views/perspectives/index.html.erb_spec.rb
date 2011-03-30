require 'spec_helper'

describe "perspectives/index.html.erb" do
  before(:each) do
    assign(:perspectives, [
      stub_model(Perspective,
        :name => "Name"
      ),
      stub_model(Perspective,
        :name => "Name"
      )
    ])
  end

  it "renders a list of perspectives" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Name".to_s, :count => 2
  end
end

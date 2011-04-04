Given /^I have no perspectives$/ do
  DocketPerspective.delete_all
end

Given /^I (only )?have perspectives titled "?([^\"]*)"?$/ do |only, titles|
  DocketPerspective.delete_all if only
  titles.split(', ').each do |title|
    Factory(:perspective, :name => title)
  end
end

Then /^I should have ([0-9]+) perspectives?$/ do |count|
  DocketPerspective.count.should == count.to_i
end


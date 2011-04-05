Given /^I have no perspectives$/ do
  DocketingPerspective.delete_all
end

Given /^I (only )?have perspectives titled "?([^\"]*)"?$/ do |only, titles|
  DocketingPerspective.delete_all if only
  titles.split(', ').each do |title|
    Factory(:docketing_perspective, :name => title)
  end
end

Then /^I should have ([0-9]+) perspectives?$/ do |count|
  DocketingPerspective.count.should == count.to_i
end


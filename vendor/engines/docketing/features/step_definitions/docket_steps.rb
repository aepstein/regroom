Given /^I have no dockets$/ do
  DocketingDocket.delete_all
end

Given /^I (only )?have dockets titled "?([^\"]*)"?$/ do |only, titles|
  DocketingDocket.delete_all if only
  titles.split(', ').each do |title|
    Factory(:docketing_docket, :name => title)
  end
end

Then /^I should have ([0-9]+) dockets?$/ do |count|
  DocketingDocket.count.should == count.to_i
end


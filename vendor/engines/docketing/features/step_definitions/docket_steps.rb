Given /^I have no dockets$/ do
  Docket.delete_all
end

Given /^I (only )?have dockets titled "?([^\"]*)"?$/ do |only, titles|
  Docket.delete_all if only
  titles.split(', ').each do |title|
    Docket.create(:name => title)
  end
end

Then /^I should have ([0-9]+) dockets?$/ do |count|
  Docket.count.should == count.to_i
end

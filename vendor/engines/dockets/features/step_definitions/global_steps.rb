Given(/^#{capture_model} (?:has|have) #{capture_fields}$/) do |name, fields|
  subject = model(name)
  parse_fields(fields).each { |field, value| subject.send( "#{field}=", value ) }
  subject.save!
end

Given /^(?:|I )(put|post|delete) on (.+)$/ do |method, page_name|
#  visit path_to(page_name), method.to_sym
  # TODO this only works with the rack driver
  Capybara.current_session.driver.process method.to_sym, path_to(page_name), {}
end

Given /^there are no (.+)s$/ do |type|
  type.classify.constantize.delete_all
end


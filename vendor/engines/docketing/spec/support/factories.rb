Factory.define :docket do |f|
  f.sequence(:name) { |i| "Docket #{i}" }
end

Factory.define :docket_item do |f|
  f.association :docket
  f.association :perspective, :factory => :docket_perspective
  f.association :creator, :factory => :user
  f.sequence(:title) { |i| "Item #{i}" }
  f.content "This is the content of the document."
end

Factory.define :docket_perspective do |f|
  f.sequence( :name ) { |i| "Perspective #{i}" }
end

Factory.define :user do |f|
  f.sequence( :username ) { |i| "User #{i}" }
  f.sequence( :email ) { |i| "user#{i}@example.com" }
  f.password "secret"
  f.password_confirmation { |u| u.password }
end


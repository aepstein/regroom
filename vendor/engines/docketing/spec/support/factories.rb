Factory.define :docketing_docket do |f|
  f.sequence(:name) { |i| "Docket #{i}" }
end

Factory.define :docketing_item do |f|
  f.association :docket, :factory => :docketing_docket
  f.association :perspective, :factory => :docketing_perspective
  f.association :creator, :factory => :docketing_user
  f.sequence(:title) { |i| "Item #{i}" }
  f.content "This is the content of the document."
end

Factory.define :docketing_perspective do |f|
  f.sequence( :name ) { |i| "Perspective #{i}" }
end

Factory.define :docketing_user, :class => 'User' do |f|
  f.sequence( :username ) { |i| "User #{i}" }
  f.sequence( :email ) { |i| "user#{i}@example.com" }
  f.password "secret"
  f.password_confirmation { |u| u.password }
end


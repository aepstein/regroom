Gem::Specification.new do |s|
  s.platform          = Gem::Platform::RUBY
  s.name              = 'refinerycms-docketing'
  s.version           = '1.0'
  s.description       = 'Ruby on Rails Docketing engine for Refinery CMS'
  s.date              = '2011-03-30'
  s.summary           = 'Dockets engine for Refinery CMS'
  s.require_paths     = %w(lib)
  s.files             = Dir['lib/**/*', 'config/**/*', 'app/**/*']
  s.add_dependency    'ancestry', '~> 1.2.4'
  s.add_dependency    'state_machine', '~> 1.0.1'
end


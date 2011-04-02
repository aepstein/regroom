Gem::Specification.new do |s|
  s.platform          = Gem::Platform::RUBY
  s.name              = 'refinerycms-dockets'
  s.version           = '1.0'
  s.description       = 'Ruby on Rails Dockets engine for Refinery CMS'
  s.date              = '2011-03-30'
  s.summary           = 'Dockets engine for Refinery CMS'
  s.require_paths     = %w(lib)
  s.files             = Dir['lib/**/*', 'config/**/*', 'app/**/*']
  s.add_dependency    'nested_set', '~> 1.6.4'
  s.add_dependency    'state_machine', '~> 0.10.2'
end


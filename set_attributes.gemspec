# -*- encoding: utf-8 -*-
Gem::Specification.new do |s|
  s.name = 'set_attributes'
  s.version = '0.1.0.2'
  s.summary = "Set an object's attributes from an object or hash with a similar attributes"
  s.description = ' '

  s.authors = ['The Eventide Project']
  s.email = 'opensource@eventide-project.org'
  s.homepage = 'https://github.com/eventide-project/set-attributes'
  s.licenses = ['MIT']

  s.require_paths = ['lib']
  s.files = Dir.glob('{lib}/**/*')
  s.platform = Gem::Platform::RUBY
  s.required_ruby_version = '>= 2.2.3'

  s.add_runtime_dependency 'telemetry-logger'

  s.add_development_dependency 'test_bench'
end

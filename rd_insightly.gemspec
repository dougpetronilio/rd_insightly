# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'rd_insightly/version'

Gem::Specification.new do |spec|
  spec.name          = 'rd_insightly'
  spec.version       = RdInsightly::VERSION
  spec.authors       = ['Douglas Oliveira']
  spec.email         = ['dougpetronilio@gmail.com']

  spec.summary       = 'Gem built to integrate leads rd and insightly'
  spec.description   = 'this Gem was built to integrate leads rd and insightly'
  spec.homepage      = 'http://github.com/dougpetronilio/rd_insightly'

  # Prevent pushing this gem to RubyGems.org by setting 'allowed_push_host', or
  # delete this section to allow pushing this gem to any host.
  if spec.respond_to?(:metadata)
    spec.metadata['allowed_push_host'] = "TODO: Set to 'http://mygemserver.com'"
  else
    fail 'RubyGems 2.0 or newer is required to protect against public gem pushes.'
  end

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = 'exe'
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ['lib']

  spec.add_development_dependency 'bundler', '~> 1.10'
  spec.add_development_dependency 'rake', '~> 10.0'
  spec.add_development_dependency 'rspec'
end

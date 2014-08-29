$:.push File.expand_path('../lib', __FILE__)

# Maintain your gem's version:
require 'streamlog/version'

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = 'streamlog'
  s.version     = Streamlog::VERSION
  s.authors     = ['Salman Afzal Siddiqui']
  s.email       = ['snnafzal@gmail.com']
  s.homepage    = 'https://github.com/salmanasiddiqui/streamlog'
  s.summary     = 'Stream your rails application logs to the browser.'
  s.description = 'Streamlog is an alternative to browserlog. The difference between these two engines is that browserlog uses polling to fetch the logs while streamlog uses streaming.'
  s.license     = 'MIT'

  s.files = Dir['{app,config,db,lib}/**/*', 'MIT-LICENSE', 'Rakefile', 'README.md']
  s.test_files = Dir['test/**/*']

  s.add_dependency 'rails', '~> 4.1'
  s.add_dependency 'jquery-rails', '~> 3.0', '>= 3.0.4'
  s.add_dependency 'file-tail', '~> 1.0', '>= 1.0.12'
end
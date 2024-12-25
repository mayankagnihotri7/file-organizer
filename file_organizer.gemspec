# frozen_string_literal: true

require File.expand_path('lib/file_organizer/version', __dir__)

Gem::Specification.new do |s|
  s.name = 'file_organizer'
  s.authors = ['Mayank Agnihotri']
  s.version = FileOrganizer::VERSION
  s.files = Dir['README.md', 'LICENSE', 'CHANGELOG.md', 'lib/**/*.rb', 'lib/**/*.rake', 'file_organizer.gemspec',
                '.github/*.md', 'Gemfile', 'Rakefile', 'CONTRIBUTING.md']
  s.licenses = ['MIT']
  s.summary = 'Organize files into their own separate folders'
  s.platform = Gem::Platform::RUBY
  s.required_ruby_version = '>= 3.1.4'
  s.extra_rdoc_files = ['README.md']
  s.add_development_dependency 'rubocop', '~> 1.68'
end

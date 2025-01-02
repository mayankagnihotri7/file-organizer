# frozen_string_literal: true

require File.expand_path("lib/organize_files/version", __dir__)

Gem::Specification.new do |s|
  s.name = "organize_files"
  s.authors = ["Mayank Agnihotri"]
  s.version = OrganizeFiles::VERSION
  s.files = Dir["README.md", "LICENSE", "CHANGELOG.md", "lib/**/*.rb", "lib/**/*.rake", "organize_files.gemspec",
                ".github/*.md", "Gemfile", "Rakefile", "CONTRIBUTING.md"]
  s.licenses = ["MIT"]
  s.summary = "Organize files into their own separate folders"
  s.platform = Gem::Platform::RUBY
  s.required_ruby_version = ">= 3.1.4"
  s.extra_rdoc_files = ["README.md"]
  s.add_dependency "zeitwerk", "~> 2.4"

  s.add_development_dependency "rspec"
  s.add_development_dependency "rubocop", "~> 1.68"

  s.executables = ["organize_files"]
  s.homepage = "https://github.com/mayankagnihotri7/file-organizer"

  s.metadata = {
    "source_code_uri" => "https://github.com/mayankagnihotri7/file-organizer"
  }
end

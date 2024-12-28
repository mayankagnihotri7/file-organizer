# frozen_string_literal: true

require 'organize_files/orgnizer'

organizer = OrganizeFiles::Organizer.new(ARGV[0])
organizer.organize

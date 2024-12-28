# frozen_string_literal: true

require 'organize_files/organizer'

organizer = OrganizeFiles::Organizer.new(ARGV[0])
organizer.organize

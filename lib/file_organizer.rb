# frozen_string_literal: true

require 'file_organizer/orgnizer'

organizer = OrganizeFiles::Organizer.new(ARGV[0])
organizer.organize

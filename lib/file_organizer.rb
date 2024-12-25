# frozen_string_literal: true

require 'file_organizer/orgnizer'

organizer = FileOrganizer::Organizer.new(ARGV[0])
organizer.organize

# frozen_string_literal: true

require_relative 'file_handler'
require_relative 'file_order'

module OrganizeFiles
  # organizer.rb
  class Organizer
    attr_reader :directory, :types, :new_folder, :new_path

    def initialize(directory)
      @directory = directory
      @file_handler = FileHandler.new(directory)
    end

    def organize
      @file_handler.scan_files.each do |file|
        next if File.directory?(file)

        categorize_file = OrganizeFiles::FileOrder.new(file).categorize
        @file_handler.move_file(file, categorize_file)
        @file_handler.remove_empty_folders
      end
    end
  end
end

# frozen_string_literal: true

require_relative "file_handler"
require_relative "file_order"

module OrganizeFiles
  class Organizer
    attr_reader :directory

    def initialize(directory)
      @directory = directory
      @file_handler = FileHandler.new(directory)
    end

    def organize
      @file_handler.scan_files.each do |file|
        next if file_directory?(file)

        categorize_file = OrganizeFiles::FileOrder.new(file).categorize
        @file_handler.move_file(file, categorize_file)
        @file_handler.remove_empty_folders
      end
    end

    private

    def file_directory?(file)
      directory = []
      expanded_file_path = File.expand_path(file, @directory)
      File.directory?(expanded_file_path) && directory << expanded_file_path

      !directory.empty?
    end
  end
end

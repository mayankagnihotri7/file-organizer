# frozen_string_literal: true

module OrganizeFiles
  class Organizer
    def initialize(directory)
      @directory = directory
      @file_handler = FileHandler.new(directory)
    end

    def organize
      @file_handler.scan_files.each do |file|
        next if file_directory?(file)

        categorize_file = FileOrder.new(file).categorize
        @file_handler.move_file(file, categorize_file)
        @file_handler.remove_empty_folders
      end
    end

    private

    def file_directory?(file)
      directories = []
      expanded_file_path = File.expand_path(file, @directory)
      File.directory?(expanded_file_path) && directories << expanded_file_path

      !directories.empty?
    end
  end
end

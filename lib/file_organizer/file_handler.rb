# frozen_string_literal: true

module FileOrganizer
  # file_handler.rb
  class FileHandler
    def initialize(directory)
      @directory = directory
    end

    def scan_files
      Dir.entries(@directory).reject { |file| file.starts_with?('.') }
    end

    def move_file(file, category)
      destination = File.join(@destination, category)

      Dir.mkdir(destination) unless Dir.exist?(destination)
      FileUtils.mv(file, destination)
    end

    def remove_empty_folders
      Dir.entries(@directory).each do |file|
        path = File.join(@directory, file)

        Dir.rmdir(path) if Dir.empty?(path)
      end
    end
  end
end

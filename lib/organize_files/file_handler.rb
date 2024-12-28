# frozen_string_literal: true
require 'fileutils'

module OrganizeFiles
  # file_handler.rb
  class FileHandler
    def initialize(directory)
      @directory = directory
    end

    def scan_files
      Dir.new(@directory).children
    end

    def move_file(file, category)
      source_path = File.join(@directory, file)
      destination = File.join(@directory, category)

      FileUtils.mkdir_p(destination) unless File.directory?(destination)

      destination_path = File.join(destination, File.basename(source_path))

      if File.exist?(source_path)
        FileUtils.mv(source_path, destination_path)
        puts "Successfully moved #{File.basename(source_path)} to #{destination_path}"
      else
        puts "File not found: #{source_path}"
      end
    end

    def remove_empty_folders
      Dir.entries(@directory).each do |file|
        path = File.join(@directory, file)

        Dir.rmdir(path) if Dir.empty?(path)
      end
    end
  end
end

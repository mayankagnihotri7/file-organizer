# frozen_string_literal: true

module FileOrganizer
  class Organizer
    attr_reader :directory, :types, :new_folder

    def initialize(directory, new_folder: false)
      @directory = directory
      @types = {
        images: ['.jpg', '.jpeg', '.png', '.gif'],
        documents: ['.pdf', '.docx', '.txt', '.md'],
        audio: ['.mp3', '.wav', '.flac'],
        videos: ['.mp4', '.mkv', '.avi'],
        archives: ['.zip', '.tar', '.rar', '.gz']
      }
      @new_folder = new_folder
    end

    def organize
      # organizing logic goes here
    end
  end
end

# frozen_string_literal: true

module FileOrganizer
  # file_sorter.rb
  class FileOrder
    TYPES = {
      images: ['.jpg', '.jpeg', '.png', '.gif'],
      documents: ['.pdf', '.docx', '.txt', '.md'],
      audio: ['.mp3', '.wav', '.flac'],
      videos: ['.mp4', '.mkv', '.avi'],
      archives: ['.zip', '.tar', '.rar', '.gz']
    }.freeze

    def initialize(file)
      @file = file
    end

    def categorize
      file_ext = File.extname(file)
      category = TYPES.find { |_key, exts| exts.include?(file_ext) }

      case category
      when :images then 'Pictures'
      when :documents then 'Documents'
      when :audio then 'Music'
      when :videos then 'Videos'
      else
        'Archives'
      end
    end
  end
end

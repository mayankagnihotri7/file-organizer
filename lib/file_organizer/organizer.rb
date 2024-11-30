# frozen_string_literal: true

module FileOrganizer
  class Organizer
    attr_reader :directory, :types, :new_folder, :new_path

    def initialize(directory, new_folder: false, new_path: nil)
      @directory = directory
      @types = {
        images: ['.jpg', '.jpeg', '.png', '.gif'],
        documents: ['.pdf', '.docx', '.txt', '.md'],
        audio: ['.mp3', '.wav', '.flac'],
        videos: ['.mp4', '.mkv', '.avi'],
        archives: ['.zip', '.tar', '.rar', '.gz']
      }
      @new_folder = new_folder
      @new_path = new_path
    end

    def organize
      Dir.foreach do |file|
        file_ext = File.extname(file)
        category = types.find { |_key, exts| exts.include?(file_ext) }

        folder_name = get_folder_name(category)

        destination = if new_folder && !new_path.empty?
                        Dir.exist?(new_path) ? new_path : FileUtils.mkdir_p(folder_name)
                      else
                        new_path.empty? ? folder_name : new_path
                      end

        FileUtils.mv(file, destination)
      end
    end

    private

    def get_folder_name(category)
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

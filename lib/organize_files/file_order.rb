# frozen_string_literal: true

module OrganizeFiles
  class FileOrder
    def initialize(file, config_file = nil)
      @file = file
      @config_file = config_file || "~/.organize_config.yml"
      @types = load_config
    end

    def categorize
      file_ext = File.extname(@file)
      category = @types.find { |_key, exts| exts.include?(file_ext) }
      return "Miscellaneous" unless category

      category[0].to_s.capitalize
    end

    private

    def load_config
      if File.exist?(@config_file)
        YAML.load_file(@config_file)
      else
        default_config
      end
    end

    def default_config
      {
        pictures: [".jpg", ".jpeg", ".png", ".gif", ".avif"],
        documents: [".pdf", ".docx", ".txt", ".md", ".json", ".csv", ".xls", ".xlsx", ".ppt", ".pptx"],
        music: [".mp3", ".wav", ".flac"],
        videos: [".mp4", ".mkv", ".avi"],
        archives: [".zip", ".tar", ".rar", ".gz", ".7z", ".iso"],
        apks: [".apk"]
      }
    end
  end
end

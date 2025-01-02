# frozen_string_literal: true

require "spec_helper"
require "organize_files/file_handler"

RSpec.describe OrganizeFiles::FileHandler do
  let(:directory) { "spec/fixtures/directory" }
  let(:test_directory) { "spec/fixtures/test_directory" }

  subject { described_class.new(directory) }

  before do
    FileUtils.mkdir_p(test_directory)
  end

  after do
    FileUtils.rm_rf(test_directory)
  end

  describe "#scan_files" do
    subject { described_class.new(directory).scan_files }

    it {
      is_expected.to eq(["document.pdf", "audio.mp3", "other-files.anything", "app.apk", "video.mp4", "picture.jpg"])
    }
  end

  describe "#move_file" do
    let(:file) { "test_file.txt" }
    let(:category) { "Documents" }
    subject { described_class.new(test_directory).move_file(file, category) }

    before do
      FileUtils.touch(File.join(test_directory, file))
    end

    it "moves the file to the specified category folder" do
      subject
      destination_path = File.join(test_directory, category, file)

      expect(File.exist?(destination_path)).to be(true)
      expect(File.exist?(File.join(test_directory,
                                   file))).to be(false)
    end

    it "creates the category folder if it does not exist" do
      subject
      expect(Dir.exist?(File.join(test_directory, category))).to be(true)
    end

    it "prints an error message if the file does not exist" do
      non_existent_file = "non_existent.txt"
      expect do
        described_class.new(test_directory).move_file(non_existent_file, category)
      end.to output(/File not found/).to_stdout
    end
  end
end

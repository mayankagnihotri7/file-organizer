# frozen_string_literal: true

require "spec_helper"
require "organize_files/organizer"

RSpec.describe OrganizeFiles::Organizer do
  let(:test_directory) { "spec/test_directory" }
  let(:image_file) { "image.jpg" }
  let(:document_file) { "document.pdf" }
  let(:unknown_file) { "unknown.xyz" }

  before do
    FileUtils.mkdir_p(test_directory)
  end

  after do
    FileUtils.rm_rf(test_directory)
  end

  describe "#organize" do
    subject { described_class.new(test_directory).organize }

    before do
      FileUtils.touch(File.join(test_directory, image_file))
      FileUtils.touch(File.join(test_directory, document_file))
      FileUtils.touch(File.join(test_directory, unknown_file))
    end

    it "categorizes and moves files to the correct folders" do
      subject

      expect(File.exist?(File.join(test_directory, "Pictures", image_file))).to be(true)
      expect(File.exist?(File.join(test_directory, "Documents",
                                   document_file))).to be(true)
      expect(File.exist?(File.join(test_directory, "Archives",
                                   unknown_file))).to be(true)

      expect(File.exist?(File.join(test_directory,
                                   image_file))).to be(false)
      expect(File.exist?(File.join(test_directory,
                                   document_file))).to be(false)
      expect(File.exist?(File.join(test_directory,
                                   unknown_file))).to be(false)
    end
  end
end

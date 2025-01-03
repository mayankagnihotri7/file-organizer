# frozen_string_literal: true

require "spec_helper"

RSpec.describe OrganizeFiles::Organizer do
  let(:test_directory) { "spec/test_directory" }
  let(:image_file) { "image.jpg" }
  let(:document_file) { "document.pdf" }
  let(:unknown_file) { "unknown.xyz" }
  let(:file_handler) { double("FileHandler") }

  before do
    FileUtils.mkdir_p(test_directory)
    allow(OrganizeFiles::FileHandler).to receive(:new).with(test_directory).and_return(file_handler)
    allow(file_handler).to receive(:scan_files).and_return([
                                                             File.join(test_directory, image_file),
                                                             File.join(test_directory, document_file),
                                                             File.join(test_directory, unknown_file)
                                                           ])
    allow(file_handler).to receive(:move_file)
  end

  after do
    FileUtils.rm_rf(test_directory)
  end

  describe "#organize" do
    context "when ignore_empty_directory is false" do
      subject { described_class.new({ directory: test_directory }).organize }

      it "removes empty folders" do
        expect(file_handler).to receive(:remove_empty_folders)

        subject
      end
    end

    context "when ignore_empty_directory is true" do
      subject { described_class.new({ directory: test_directory, ignore_empty_directory: true }).organize }

      it "does not remove empty folders" do
        expect(file_handler).not_to receive(:remove_empty_folders)

        subject
      end
    end

    context "categorizes and moves files to the correct folders" do
      subject { described_class.new({ directory: test_directory }).organize }

      it "moves files" do
        expect(file_handler).to receive(:move_file).exactly(3).times
        expect(file_handler).to receive(:remove_empty_folders)

        subject
      end
    end
  end
end

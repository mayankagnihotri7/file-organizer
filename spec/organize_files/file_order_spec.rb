# frozen_string_literal: true

require "spec_helper"
require "organize_files/file_order"

RSpec.describe OrganizeFiles::FileOrder do
  subject { described_class.new }

  describe "#categorize" do
    subject { described_class.new(file).categorize }

    context "when file is an image" do
      let(:file) { "picture.jpg" }

      it { is_expected.to eq("Pictures") }
    end

    context "when file is a document" do
      let(:file) { "document.pdf" }

      it { is_expected.to eq("Documents") }
    end

    context "when file is audio" do
      let(:file) { "audio.mp3" }

      it { is_expected.to eq("Music") }
    end
    context "when file is a video" do
      let(:file) { "video.mp4" }

      it { is_expected.to eq("Videos") }
    end
    context "when file is an APK" do
      let(:file) { "app.apk" }

      it { is_expected.to eq("Apks") }
    end
    context "when file is something else" do
      let(:file) { "other-files.anything" }

      it { is_expected.to eq("Archives") }
    end
  end
end

# frozen_string_literal: true

require "zeitwerk"

module OrganizeFiles
  @loader = Zeitwerk::Loader.for_gem
  @loader.setup
end

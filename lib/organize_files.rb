# frozen_string_literal: true

require "zeitwerk"
require "yaml"

module OrganizeFiles
  @loader = Zeitwerk::Loader.for_gem
  @loader.setup
end

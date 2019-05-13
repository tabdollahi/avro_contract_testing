# frozen_string_literal: true

require 'avro_contract_testing/version'
require 'avro_contract_testing/configuration'

module AvroContractTesting
  class Error < StandardError; end

  class << self
    def configure
      yield configuration
    end

    def configuration
      @configuration ||= Configuration.new
    end

    def reset
      @configuration = nil
    end
  end
end

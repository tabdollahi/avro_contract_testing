# frozen_string_literal: true

require 'avro_turf'

module AvroContractTesting
  class Consumer
    attr_reader :application_name, :schema

    def initialize(application_name:, schema:)
      @application_name = application_name
      @schema = Avro::Schema.parse(schema)
    end

    def compatible?(producer_schema)
      writer_schema = Avro::Schema.parse(producer_schema)
      Avro::SchemaCompatibility.can_read?(writer_schema, schema)
    end
  end
end

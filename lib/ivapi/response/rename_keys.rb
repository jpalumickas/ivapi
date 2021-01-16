# frozen_string_literal: true

require 'faraday'

module Ivapi
  # Faraday response middleware
  module Response
    class RenameKeys < Faraday::Response::Middleware
      UNUSED_KEYS = %w[ac_ us_ bo_ or_ se_ ta_ in_].freeze

      def on_complete(response)
        response[:body] = rename_keys(response[:body])
      end

      private

      def rename_keys(input)
        case input
        when Hash
          rename_keys_from_hash(input)
        when Array
          input.map { |value| rename_keys(value) }
        else
          input
        end
      end

      def rename_keys_from_hash(input)
        new_hash = {}

        input.map do |key, value|
          case value
          when Hash
            value = rename_keys(value)
          when Array
            value = value.map { |v| rename_keys(v) }
          end

          new_hash[key.gsub(Regexp.union(UNUSED_KEYS), '')] = value
        end

        new_hash
      end
    end
  end
end

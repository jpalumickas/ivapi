require 'faraday'

module Ivapi
  # Faraday response middleware
  module Response
    class RenameKeys < Faraday::Response::Middleware
      UNUSED_KEYS = [
        'ac_', 'us_', 'bo_', 'or_', 'se_', 'ta_', 'in_'
     ].freeze

      private

      def on_complete(response)
        response[:body] = rename_keys(response[:body])
      end

      def rename_keys(input)
        if input.is_a?(Hash)
          new = {}
          input.map do |key, value|
            if value.is_a?(Hash)
              value = rename_keys(value)
            elsif value.is_a?(Array)
              value = value.map { |v| rename_keys(v) }
            end

            new[key.gsub(Regexp.union(UNUSED_KEYS), '')] = value
          end
          new
        elsif input.is_a?(Array)
          input.map { |value| rename_keys(value) }
        else
          input
        end
      end
    end
  end
end

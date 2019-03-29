# frozen_string_literal: true

module Ivapi
  class Client
    class Hosting < Base
      attr_reader :hosting_id

      def initialize(client, hosting_id)
        super(client)
        @hosting_id = hosting_id
      end

      def information
        params = { command: 'hosting_info', id: hosting_id }
        get('/json.php', params)
      end
      alias info information
    end
  end
end

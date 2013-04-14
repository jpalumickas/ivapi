module Ivapi
  class Client
    module Server
      def server_info
        params = { command: 'server_info' , id: server_id}
        get('/json.php', params)
      end
    end
  end
end
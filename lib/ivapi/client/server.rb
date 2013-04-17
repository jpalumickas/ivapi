module Ivapi
  class Client
    module Server
      def server_info
        params = { command: 'server_info', id: server_id }
        get('/json.php', params)
      end

      def server_tasks(count, options={})
        params = options.merge({ command: 'server_tasks', id: server_id, count: count })
        get('/json.php', params)
      end

      def server_graphs(width, ip)
        params = options.merge({ command: 'server_graphs' , id: server_id, width: width, ip: ip })
        get('/json.php', params)
      end

      def server_os
        params = { command: 'server_os', id: server_id }
        get('/json.php', params)
      end

      def server_reboot
        params = { command: 'server_reboot', id: server_id }
        get('/json.php', params)
      end

      def server_recreate
        params = { command: 'server_recreate', id: server_id }
        get('/json.php', params)
      end

      def server_change
        params = { command: 'server_change', id: server_id }
        get('/json.php', params)
      end

      def server_domain
        params = { command: 'server_domain', id: server_id }
        get('/json.php', params)
      end
    end
  end
end
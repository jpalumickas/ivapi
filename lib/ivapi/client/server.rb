module Ivapi
  class Client
    module Server

      # Get server information.
      #
      # Returns the hash of server information.
      def server_info
        params = { command: 'server_info', id: server_id }
        get('/json.php', params)
      end

      # Get server tasks.
      #
      # count  - The Integer number of results count (Max 1000).
      # options - The Hash of options (Available: task, task_id).
      #
      # Returns The Hash of server tasks.
      def server_tasks(count, options={})
        params = options.merge({ command: 'server_tasks', id: server_id, count: count })
        get('/json.php', params)
      end

      # Get server graphs.
      #
      # width  - The Integer number of graphs width (Max 1000, Optimal: 768).
      # ip - The String of IP, who can view graphs.
      #
      # Returns the hash of server graphs.
      def server_graphs(width, ip)
        params = { command: 'server_graphs' , id: server_id, width: width, ip: ip }
        get('/json.php', params)
      end

      # Get all available server os.
      #
      # Returns the hash of server os.
      def server_os
        params = { command: 'server_os', id: server_id }
        get('/json.php', params)
      end

      # Send command to reboot the server.
      #
      # Returns The Integer of task id.
      def server_reboot
        params = { command: 'server_reboot', id: server_id }
        get('/json.php', params)
      end

      # Send command to recreate the server.
      #
      # Returns The Integer of task id.
      def server_recreate
        params = { command: 'server_recreate', id: server_id }
        get('/json.php', params)
      end

      # Send command to reset server password.
      #
      # Returns The Integer of task id.
      def server_reset_password
        params = { command: 'server_reset_password', id: server_id }
        get('/json.php', params)
      end

      # Send command to clean server firewall rules.
      #
      # Returns The Integer of task id.
      def server_flush_iptables
        params = { command: 'server_flush_iptables', id: server_id }
        get('/json.php', params)
      end

      # Send command to change server plan.
      #
      # Returns The Integer of task id.
      def server_change
        params = { command: 'server_change', id: server_id }
        get('/json.php', params)
      end

      # Send command to change server hostname.
      #
      # Returns The Integer of task id.
      def server_domain
        params = { command: 'server_domain', id: server_id }
        get('/json.php', params)
      end
    end
  end
end
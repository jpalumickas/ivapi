module Ivapi
  class Client
    module Server

      # Get information about server.
      #
      # Returns the Hash of server information.
      def server_info
        params = { command: 'server_info', id: server_id }
        get('/json.php', params)
      end

      # Get server tasks.
      #
      # count   - The Integer number of results count (max: 1000).
      # options - The Hash options (default: {}):
      #           :task    - The String of task name (optional).
      #           :task_id - The Integer of task id (optional).
      #
      # Returns The Hash of server tasks.
      def server_tasks(count, options={})
        params = options.merge({ command: 'server_tasks', id: server_id, count: count })
        get('/json.php', params)
      end

      # Get server graphs.
      #
      # width - The Integer number of graphs width (max: 1000, optimal: 768).
      # ip    - The String of ip, from which graphs can be viewed.
      #
      # Returns the Hash of server graphs.
      def server_graphs(width, ip)
        params = { command: 'server_graphs' , id: server_id, width: width, ip: ip }
        get('/json.php', params)
      end

      # Get all available server operating systems.
      #
      # Returns the Hash of available server os.
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
      # os           - The String of os (operating system) id.
      # new_password - The String of new server password (min: 8, max: 64).
      #
      # Returns The Integer of task id.
      def server_recreate(os, options={})
        params = options.merge({ command: 'server_recreate', id: server_id, os: os })
        get('/json.php', params)
      end

      # Send command to reset server password.
      #
      # new_password - The String of new server password (min: 8, max: 64).
      #
      # Returns The Integer of task id.
      def server_reset_password(options={})
        params = options.merge({ command: 'server_reset_password', id: server_id })
        get('/json.php', params)
      end

      # Send command to clean server firewall rules.
      #
      # Returns The Integer of task id.
      def server_flush_iptables
        params = { command: 'server_flush_iptables', id: server_id }
        get('/json.php', params)
      end

      # Send command to change firewall settings
      #
      # pps       - The Integer of incoming ICMP, UDP, TCP joins per
      #             second (1000 - 5000).
      # pps_icmp  - The Integer of ICMP packets per second (0 or 10 - 500).
      # pps_udp   - The Integer of UDP packets per second (0 or 10 - 500).
      # pps_syn   - The Integer of TCP SYN packets per second from one
      #             IP (0 or 2 - 20).
      # connlimit - The Integer of collateral connections from one
      #             IP (0 or 16 - 512).
      #
      # Returns The Hash of new firewall settings.
      def server_firewall(options={})
        params = options.merge({ command: 'server_firewall', id: server_id })
        get('/json.php', params)
      end

      # Send command to change server plan.
      #
      # cpu -       The Integer of GHz (minimum: 2, maximum: 16)
      # ram -       The Integer of MB (minimum: 2048, maximum: 16384)
      # quota -     The Integer of GB (minimum: 20, maximum: 800)
      # bandwidth - The Integer of Mbps (minimum: 20, maximum: 400)
      #
      # Returns The Integer of task id.
      def server_change(options={})
        params = options.merge({ command: 'server_change', id: server_id })
        get('/json.php', params)
      end

      # Send command to change server hostname.
      #
      # domain - The String of new server hostname.
      #
      # Returns The Integer of task id.
      def server_domain(domain)
        params = { command: 'server_domain', id: server_id, domain: domain }
        get('/json.php', params)
      end
    end
  end
end

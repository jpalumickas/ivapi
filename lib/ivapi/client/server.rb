module Ivapi
  class Client
    class Server < Base
      attr_reader :server_id

      def initialize(client, server_id)
        super(client)
        @server_id = server_id
      end

      # Get information about server.
      #
      # Returns the Hash of server information.
      def information
        params = { command: 'server_info', id: server_id }
        get('/json.php', params)
      end
      alias info information

      # Get server tasks.
      #
      # count   - The Integer number of results count (max: 1000).
      # options - The Hash options (default: {}):
      #           :task    - The String of task name (optional).
      #           :task_id - The Integer of task id (optional).
      #
      # Returns the Hash of server tasks.
      def tasks(count, options = {})
        params = options.merge(
          command: 'server_tasks', id: server_id, count: count
        )

        get('/json.php', params)
      end

      # Get server graphs.
      #
      # width - The Integer number of graphs width (max: 1000, optimal: 768).
      # ip    - The String of ip, from which graphs can be viewed.
      #
      # Returns the Hash of server graphs.
      def graphs(width, ip)
        params = {
          command: 'server_graphs',
          id: server_id,
          width: width,
          ip: ip
        }

        get('/json.php', params)
      end

      # Get all available server operating systems.
      #
      # Returns the Hash of available server os.
      def os
        params = { command: 'server_os', id: server_id }
        get('/json.php', params)
      end

      # Send command to reboot the server.
      #
      # Returns the Integer of task id.
      def reboot
        params = { command: 'server_reboot', id: server_id }
        get('/json.php', params)
      end

      # Send command to recreate the server.
      #
      # os      - The String of os (operating system) id.
      # options - The Hash options (default: {}):
      #           :new_password - The String of new server
      #                           password (min: 8, max: 64).
      #
      # Returns the Integer of task id.
      def recreate(os, options = {})
        params = options.merge(
          command: 'server_recreate', id: server_id, os: os
        )

        get('/json.php', params)
      end

      # Send command to reset server password.
      #
      # options - The Hash options (default: {}):
      #           :new_password - The String of new server
      #                           password (min: 8, max: 64).
      #
      # Returns the Integer of task id.
      def reset_password(options = {})
        params = options.merge(command: 'server_reset_password', id: server_id)

        get('/json.php', params)
      end

      # Send command to clean server firewall rules.
      #
      # Returns the Integer of task id.
      def flush_iptables
        params = { command: 'server_flush_iptables', id: server_id }
        get('/json.php', params)
      end

      # Send command to change firewall settings.
      #
      # options - The Hash options (default: {}):
      #           :pps       - The Integer of incoming ICMP, UDP, TCP joins per
      #                        second (min: 1000, max: 5000).
      #           :pps_icmp  - The Integer of ICMP packets per
      #                        second (0 or min: 10, max: 500).
      #           :pps_udp   - The Integer of UDP packets per
      #                        second (0 or min: 10, max: 500).
      #           :pps_syn   - The Integer of TCP SYN packets per second from
      #                        one IP (0 or min: 2, max: 20).
      #           :connlimit - The Integer of collateral connections from one
      #                        IP (0 or min: 16, max: 512).
      #
      # Returns the Hash of new firewall settings.
      def firewall(options = {})
        params = options.merge(command: 'server_firewall', id: server_id)
        get('/json.php', params)
      end

      # Reverse PTR record change for additional IP.
      #
      # options - The Hash options (default: {}):
      #           :ip     - The String of additional IP.
      #           :domain - The String of reverse PTR.
      #
      # Returns the Hash of new ptr info.
      def ptr(options = {})
        params = options.merge(command: 'server_ptr', id: server_id)
        get('/json.php', params)
      end

      # Moves additional IP to another server.
      #
      # ip        - The String of additional IP.
      # target_id - The String of another server id.
      #
      # Returns the Hash with information.
      def move_ip(ip, target_id)
        params = {
          command: 'server_move_ip',
          id: server_id,
          ip: ip,
          target_id: target_id
        }

        get('/json.php', params)
      end

      # Send command to change server plan.
      #
      # options - The Hash options (default: {}):
      #           :cpu -       The Integer of GHz (min: 2, max: 16).
      #           :ram -       The Integer of MB (min: 2048, max: 16384).
      #           :quota -     The Integer of GB (min: 20, max: 800).
      #           :bandwidth - The Integer of Mbps (min: 20, max: 400).
      #
      # Returns the Integer of task id.
      def change(options = {})
        params = options.merge(command: 'server_change', id: server_id)
        get('/json.php', params)
      end

      # Send command to change server hostname.
      #
      # domain - The String of new server hostname.
      #
      # Returns the Integer of task id.
      def domain(domain)
        params = { command: 'server_domain', id: server_id, domain: domain }
        get('/json.php', params)
      end
      alias hostname domain
    end
  end
end

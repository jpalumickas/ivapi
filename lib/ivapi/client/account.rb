module Ivapi
  class Client
    class Account < Base
      # Get information about account.
      #
      # Returns the Hash of account information.
      def information
        params = { command: 'account_info' }
        get('/json.php', params)
      end
      alias_method :info, :information

      # Get account orders.
      #
      # Returns the Hash of account orders.
      def orders
        params = { command: 'account_orders' }
        get('/json.php', params)
      end

      # Get account services.
      #
      # Returns the Hash of account services.
      def services
        params = { command: 'account_services' }
        get('/json.php', params)
      end

      # Get account credits.
      #
      # count - The Integer of how many rows need to return (default: 10).
      #
      # Returns the Hash of account credits.
      def credits(count = 10)
        params = { command: 'account_credits', count: count }
        get('/json.php', params)
      end

      # Get account bonuses.
      #
      # count - The Integer of how many rows need to return (default: 10).
      #
      # Returns the Hash of account bonuses.
      def bonuses(count = 10)
        params = { command: 'account_bonuses', count: count }
        get('/json.php', params)
      end
    end
  end
end

module Ivapi
  class Client
    module Account
      def account_info
        params = { command: 'account_info' }
        get('/json.php', params)
      end

      def account_orders
        params = { command: 'account_orders' }
        get('/json.php', params)
      end

      def account_services
        params = { command: 'account_services' }
        get('/json.php', params)
      end

      def account_credits(count = 10)
        options = { command: 'account_credits', count: count }
        get('/json.php', params)
      end

      def account_bonuses(count = 10)
        params = { :command => 'account_bonuses', count: count }
        get('/json.php', params)
      end
    end
  end
end

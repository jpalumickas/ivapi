require "ivapi/base"

module Ivapi
  class Account < Base

    def info
      options = { :command => 'account_info' }
      self.class.get(self.file, :query => options.merge!(@auth))
    end

    def orders
      options = { :command => 'account_orders' }
      self.class.get(self.file, :query => options.merge!(@auth))
    end

    def services
      options = { :command => 'account_services' }
      self.class.get(self.file, :query => options.merge!(@auth))
    end

    def credits(o = { :count => 10 })
      options = { :command => 'account_credits' }.merge!(o)
      self.class.get(self.file, :query => options.merge!(@auth))
    end

    def bonuses(o = { :count => 10 })
      options = { :command => 'account_bonuses' }.merge!(o)
      self.class.get(self.file, :query => options.merge!(@auth))
    end

  end
end

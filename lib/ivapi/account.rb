module Ivapi
  module Account

    def account_info
      options = { :command => 'account_info' }
      self.class.get(self.file, :query => options.merge!(@auth))
    end

  end
end

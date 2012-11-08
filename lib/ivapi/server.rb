require "ivapi/base"

module Ivapi
  class Server < Base

    attr_reader :server_id

    def id(i)
      @server_id = i
      self
    end

    def info
      options = { :command => 'server_info' , :id => self.server_id }
      self.class.get(self.file, :query => options.merge!(@auth))
    end

    def tasks(o={})
      options = { :command => 'server_tasks' , :id => self.server_id, :count => 10 }.merge!(o)
      self.class.get(self.file, :query => options.merge!(@auth))
    end

    def graphs(o={})
      options = { :command => 'server_graphs' , :id => self.server_id }.merge!(o)
      self.class.get(self.file, :query => options.merge!(@auth))
    end

    def os
      options = { :command => 'server_os' , :id => self.server_id }
      self.class.get(self.file, :query => options.merge!(@auth))
    end

    def reboot
      options = { :command => 'server_reboot' , :id => self.server_id }
      self.class.get(self.file, :query => options.merge!(@auth))
    end

    def recreate(o={})
      options = { :command => 'server_recreate' , :id => self.server_id }.merge!(o)
      self.class.get(self.file, :query => options.merge!(@auth))
    end

    def reset_password
      options = { :command => 'server_reset_password' , :id => self.server_id }
      self.class.get(self.file, :query => options.merge!(@auth))
    end

    def change(o={})
      options = { :command => 'server_change' , :id => self.server_id }.merge!(o)
      self.class.get(self.file, :query => options.merge!(@auth))
    end

    def domain(o={})
      options = { :command => 'server_domain' , :id => self.server_id }.merge!(o)
      self.class.get(self.file, :query => options.merge!(@auth))
    end

  end
end

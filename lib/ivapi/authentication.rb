module Ivapi
  module Authentication
    def authentication
      if @username && @password
        { nick: @username, password: @password }
      else
        {}
      end
    end

    def authenticated?
      !authentication.empty?
    end
  end
end

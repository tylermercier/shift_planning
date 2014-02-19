require 'http'
require 'json'
require 'base64'

module ShiftPlanning
  class Client
    def initialize(config = {})
      raise ArgumentError.new('Missing username') unless config.has_key? :username
      @username = config[:username]
      raise ArgumentError.new('Missing password') unless config.has_key? :password
      @password = config[:password]
      raise ArgumentError.new('Missing api key') unless config.has_key? :key
      @key = config[:key]
      @url = 'http://www.shiftplanning.com/api/'
      @headers = {
        "Content-Type" => "application/x-www-form-urlencoded"
      }
    end

    def authenticated?
      !@token.nil?
    end

    def authenticate
      body = body_formatter({
        "key" => @key,
        "request" => {
          "module" => "staff.login",
          "method" => "GET",
          "username" => @username,
          "password" => @password
        }
      })
      response = HTTP.with(@headers).post(@url, body)
      @token = JSON.parse(response)["token"]
    end

    def request(api_module, request={}, method='GET')
      authenticate unless authenticated?

      body = body_formatter({
        "token" => @token,
        "method" => method,
        "module" => api_module,
        "request" => request
      })
      response = HTTP.with(@headers).post(@url, body)
      JSON.parse(response)
    end

    def body_formatter(body)
      {
        :body => "data=#{JSON.dump(body)}"
      }
    end
  end
end

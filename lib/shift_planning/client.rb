require "http"
require "json"
require "base64"
require_relative "api_error"

module ShiftPlanning
  class Client
    def initialize(config = {})
      raise ArgumentError.new('Missing username') unless config.key? :username
      @username = config[:username]
      raise ArgumentError.new('Missing password') unless config.key? :password
      @password = config[:password]
      raise ArgumentError.new('Missing api key') unless config.key? :key
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

    def get(api_module, request={})
      request("GET", api_module, request)
    end

    def create(api_module, request={})
      request("CREATE", api_module, request)
    end

    def update(api_module, request={})
      request("UPDATE", api_module, request)
    end

    def delete(api_module, request={})
      request("DELETE", api_module, request)
    end

    private

    def request(method, api_module, request)
      authenticate unless authenticated?

      body = body_formatter({
        "token" => @token,
        "method" => method,
        "module" => api_module,
        "request" => request
      })
      response = HTTP.with(@headers).post(@url, body)
      result = JSON.parse(response)
      raise ApiError.new(result) if result["status"] != "1"
      result
    end

    def body_formatter(body)
      {
        :body => "data=#{JSON.dump(body)}"
      }
    end
  end
end

module ShiftPlanning
  class ApiError < Exception
    attr_accessor :message

    def initialize(response)
      @message = message_for_status(response["status"])
    end

    def message_for_status(status)
      case status
      when "-3" then "Flagged API Key - Pemanently Banned"
      when "-2" then "Flagged API Key - Too Many invalid access attempts - contact us"
      when "-1" then "Flagged API Key - Temporarily Disabled - contact us"
      when "1" then "Success -"
      when "2" then "Invalid API key - App must be granted a valid key by ShiftPlanning"
      when "3" then "Invalid token key - Please re-authenticate"
      when "4" then "Invalid Method - No Method with that name exists in our API"
      when "5" then "Invalid Module - No Module with that name exists in our API"
      when "6" then "Invalid Action - No Action with that name exists in our API"
      when "7" then "Authentication Failed - You do not have permissions to access the service"
      when "8" then "Missing parameters - Your request is missing a required parameter"
      when "9" then "Invalid parameters - Your request has an invalid parameter type"
      when "10" then "Extra parameters - Your request has an extra/unallowed parameter type"
      when "12" then "Create Failed - Your CREATE request failed"
      when "13" then "Update Failed - Your UPDATE request failed"
      when "14" then "Delete Failed - Your DELETE request failed"
      when "15" then "Get Failed - Your GET request failed"
      when "20" then "Incorrect Permissions - You don't have the proper permissions to access this"
      when "90" then "Suspended API key - Access for your account has been suspended, please contact ShiftPlanning"
      when "91" then "Throttle exceeded - You have exceeded the max allowed requests. Try again later."
      when "98" then "Bad API Paramaters - Invalid POST request. See Manual."
      when "99" then "Service Offline - This service is temporarily offline. Try again later."
      when "100" then "Can not connect to LDAP - host or port are incorect"
      when "101" then "Can not connect to LDAP - username or password are incorrect"
      else "Unknown status response: #{status}"
      end
    end
  end
end

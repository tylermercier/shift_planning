require 'test_helper'

describe 'ApiError' do
  describe '#constructor' do
    def check(status, message)
      error = ShiftPlanning::ApiError.new("status" => status)
      assert_equal message, error.message
    end

    it "handles api status" do
      check("-3", "Flagged API Key - Pemanently Banned")
      check("-2", "Flagged API Key - Too Many invalid access attempts - contact us")
      check("-1", "Flagged API Key - Temporarily Disabled - contact us")
      check("1", "Success -")
      check("2", "Invalid API key - App must be granted a valid key by ShiftPlanning")
      check("3", "Invalid token key - Please re-authenticate")
      check("4", "Invalid Method - No Method with that name exists in our API")
      check("5", "Invalid Module - No Module with that name exists in our API")
      check("6", "Invalid Action - No Action with that name exists in our API")
      check("7", "Authentication Failed - You do not have permissions to access the service")
      check("8", "Missing parameters - Your request is missing a required parameter")
      check("9", "Invalid parameters - Your request has an invalid parameter type")
      check("10", "Extra parameters - Your request has an extra/unallowed parameter type")
      check("12", "Create Failed - Your CREATE request failed")
      check("13", "Update Failed - Your UPDATE request failed")
      check("14", "Delete Failed - Your DELETE request failed")
      check("15", "Get Failed - Your GET request failed")
      check("20", "Incorrect Permissions - You don't have the proper permissions to access this")
      check("90", "Suspended API key - Access for your account has been suspended, please contact ShiftPlanning")
      check("91", "Throttle exceeded - You have exceeded the max allowed requests. Try again later.")
      check("98", "Bad API Paramaters - Invalid POST request. See Manual.")
      check("99", "Service Offline - This service is temporarily offline. Try again later.")
      check("100", "Can not connect to LDAP - host or port are incorect")
      check("101", "Can not connect to LDAP - username or password are incorrect")
    end
  end
end

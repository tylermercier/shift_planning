require 'test_helper'

describe 'ApiError' do
  it "Maps status codes" do
    assert_status_code(-3, "Flagged API Key - Pemanently Banned")
    assert_status_code(-2, "Flagged API Key - Too Many invalid access attempts - contact us")
    assert_status_code(-1, "Flagged API Key - Temporarily Disabled - contact us")
    assert_status_code(1, "Success -")
    assert_status_code(2, "Invalid API key - App must be granted a valid key by ShiftPlanning")
    assert_status_code(3, "Invalid token key - Please re-authenticate")
    assert_status_code(4, "Invalid Method - No Method with that name exists in our API")
    assert_status_code(5, "Invalid Module - No Module with that name exists in our API")
    assert_status_code(6, "Invalid Action - No Action with that name exists in our API")
    assert_status_code(7, "Authentication Failed - You do not have permissions to access the service")
    assert_status_code(8, "Missing parameters - Your request is missing a required parameter")
    assert_status_code(9, "Invalid parameters - Your request has an invalid parameter type")
    assert_status_code(10, "Extra parameters - Your request has an extra/unallowed parameter type")
    assert_status_code(12, "Create Failed - Your CREATE request failed")
    assert_status_code(13, "Update Failed - Your UPDATE request failed")
    assert_status_code(14, "Delete Failed - Your DELETE request failed")
    assert_status_code(15, "Get Failed - Your GET request failed")
    assert_status_code(20, "Incorrect Permissions - You don't have the proper permissions to access this")
    assert_status_code(90, "Suspended API key - Access for your account has been suspended, please contact ShiftPlanning")
    assert_status_code(91, "Throttle exceeded - You have exceeded the max allowed requests. Try again later.")
    assert_status_code(98, "Bad API Paramaters - Invalid POST request. See Manual.")
    assert_status_code(99, "Service Offline - This service is temporarily offline. Try again later.")
    assert_status_code(100, "Can not connect to LDAP - host or port are incorect")
    assert_status_code(101, "Can not connect to LDAP - username or password are incorrect")
  end

  def assert_status_code(status, message)
    error = ShiftPlanning::ApiError.new("status" => status)
    assert_equal message, error.message
  end
end

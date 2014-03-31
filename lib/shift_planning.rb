require "shift_planning/version"
require "shift_planning/api_error"
require "shift_planning/client"

module ShiftPlanning
  extend self

  def init(options={})
    @@client = ShiftPlanning::Client.new(options)
  end

  def get(api_module, request={})
    @@client.request("GET", api_module, request)
  end

  def create(api_module, request={})
    @@client.request("CREATE", api_module, request)
  end

  def update(api_module, request={})
    @@client.request("UPDATE", api_module, request)
  end

  def delete(api_module, request={})
    @@client.request("DELETE", api_module, request)
  end

  # convenience methods

  def skills
    get('staff.skills')
  end

  def employees
    get('staff.employees')
  end

  def employee(employee_id)
    get('staff.employee', "id" => employee_id)
  end

  def add_skill(employee_id, skill_id)
    update('staff.employee', {
      "id" => employee_id,
      "addskill" => skill_id
    })
  end

  def remove_skill(employee_id, skill_id)
    update('staff.employee', {
      "id" => employee_id,
      "removeskill" => skill_id
    })
  end
end

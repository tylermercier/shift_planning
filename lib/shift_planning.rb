require "shift_planning/version"
require "shift_planning/client"

module ShiftPlanning
  extend self

  def init(options={})
    @@client = ShiftPlanning::Client.new(options)
  end

  def skills
    @@client.request('staff.skills')
  end

  def employees
    @@client.request('staff.employees')
  end

  def employee(employee_id)
    @@client.request('staff.employee', "id" => employee_id)
  end

  def add_skill(employee_id, skill_id)
    args = {
      "id" => employee_id,
      "addskill" => skill_id
    }
    @@client.request('staff.employee', args, "UPDATE")
  end

  def remove_skill(employee_id, skill_id)
    args = {
      "id" => employee_id,
      "removeskill" => skill_id
    }
    @@client.request('staff.employee', args, "UPDATE")
  end
end

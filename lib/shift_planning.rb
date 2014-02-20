require "shift_planning/version"
require "shift_planning/client"

module ShiftPlanning
  extend self

  def init(options={})
    @@client = Client.new(options)
  end

  def skills
    @@client.get('staff.skills')
  end

  def employees
    @@client.get('staff.employees')
  end

  def employee(employee_id)
    @@client.get('staff.employee', "id" => employee_id)
  end

  def add_skill(employee_id, skill_id)
    @@client.update('staff.employee', {
      "id" => employee_id,
      "addskill" => skill_id
    })
  end

  def remove_skill(employee_id, skill_id)
    @@client.update('staff.employee', {
      "id" => employee_id,
      "removeskill" => skill_id
    })
  end
end

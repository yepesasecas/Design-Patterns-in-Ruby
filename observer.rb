require 'observer'
# -------------------------------------------------------------------------
#  Observable Object
# -------------------------------------------------------------------------
class Employee
  include Observable

  attr_reader :name
  attr_accessor :title, :salary

  def initialize(name, title, salary, payroll)
    @name = name
    @title = title
    @salary = salary
    @payroll = payroll
  end

  def salary=(new_salary)
    @salary = new_salary
    changed
    notify_observers(self)
  end
end

# -------------------------------------------------------------------------
#  Observers
# -------------------------------------------------------------------------
class Payroll
  def update(employee)
    p "Cut a new check for #{employee.name}"
    p "His salary is now #{employee.salary}"
  end
end

class TaxMan
  def update(employee)
    p "Send new Tax Bill to #{employee.name}"
  end
end


# -------------------------------------------------------------------------
#  Init
# -------------------------------------------------------------------------
payroll = Payroll.new
taxMan = TaxMan.new
employee = Employee.new("Jaime", "Seductor", 1000, Payroll.new)
employee.add_observer(payroll)
employee.add_observer(taxMan)
employee.salary=(1500)

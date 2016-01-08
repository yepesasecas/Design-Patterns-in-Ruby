class Employee
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
    @payroll.update(self)
  end
end

class Payroll
  def update(employee)
    p "Cut a new check for #{employee.name}"
    p "His salary is now #{employee.salary}"
  end
end

employee = Employee.new("Jaime", "Seductor", 1000, Payroll.new)
employee.salary=(1500)

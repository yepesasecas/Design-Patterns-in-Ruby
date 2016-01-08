class Employee
  attr_reader :name
  attr_accessor :title, :salary

  def initialize(name, title, salary, payroll)
    @name = name
    @title = title
    @salary = salary
    @payroll = payroll
    @observers = []
  end

  def salary=(new_salary)
    @salary = new_salary
    notify_observers()
  end

  def notify_observers
    @observers.each {|observer| observer.update(self)}
  end

  def add_observer(observer)
    @observers << observer
  end

  def delete_observer(observer)
    @observers.delete(observer)
  end
end

class Payroll
  def update(employee)
    p "Cut a new check for #{employee.name}"
    p "His salary is now #{employee.salary}"
  end
end

payroll = Payroll.new
employee = Employee.new("Jaime", "Seductor", 1000, Payroll.new)
employee.add_observer(payroll)
employee.salary=(1500)

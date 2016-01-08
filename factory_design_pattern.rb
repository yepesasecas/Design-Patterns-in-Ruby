class Animal
    def initialize(name)
    @name = name
  end

  def eat
    raise "define"
  end

  def speak
    raise "define"
  end

  def sleep
    raise "define"
  end
end

class Duck < Animal
  def eat
    p "Duck #{@name} eats."
  end

  def speak
    p "Duck #{@name} speaks."
  end

  def sleep
    p "Duck #{@name} sleeps."
  end
end

class Frog < Animal
  def eat
    p "Frog #{@name} eats."
  end

  def speak
    p "Frog #{@name} speaks."
  end

  def sleep
    p "Frog #{@name} sleeps."
  end
end

class Pond
  def initialize(number_animals)
    @animals = []
    number_animals.times do |i|
      animal = new_animal(i)
      @animals << animal
    end
  end

  def simulate_one_day
    @animals.each {|animal| animal.speak}
    @animals.each {|animal| animal.eat}
    @animals.each {|animal| animal.sleep}
  end
end

class FrogPond < Pond
  def new_animal(i)
    Frog.new "Frog#{i}"
  end
end

class DuckPond < Pond
  def new_animal(i)
    Duck.new "Duck#{i}"
  end
end


frogPond = FrogPond.new 3
duckPond = DuckPond.new 3

frogPond.simulate_one_day
duckPond.simulate_one_day



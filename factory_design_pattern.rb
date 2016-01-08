#  ----------------------------------------------------------------------------
#  Creator
#  ----------------------------------------------------------------------------

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

class Tiger < Animal
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

class Tiger < Animal
  def eat
    p "Tiger #{@name} eats."
  end

  def speak
    p "Tiger #{@name} speaks."
  end

  def sleep
    p "Tiger #{@name} sleeps."
  end
end

class Tree
  def initialize(name)
    @name = name
  end

  def grow
    p "The Tree #{@name} grows"
  end
end

class Algae
  def initialize(name)
    @name = name
  end

  def grow
    p "The Algae #{@name} grows"
  end
end

class Waterlily
  def initialize(name)
    @name = name
  end

  def grow
    p "The Waterlily #{@name} grows"
  end
end

#  ----------------------------------------------------------------------------
#  Product
#  ----------------------------------------------------------------------------


class Habitat
  def initialize(animal_class, number_animals, plant_class, number_plants)
    @animal_class = animal_class
    @plant_class = plant_class

    @animals = []
    number_animals.times do |i|
      animal = new_organism(:animal, "#{@animal_class.to_s}#{i}")
      @animals << animal
    end

    @plants = []
    number_plants.times do |i|
      plant = new_organism(:plant, "plant#{i}")
      @plants << plant
    end
  end

  def simulate_one_day
    @plants.each {|plant| plant.grow}
    @animals.each {|animal| animal.speak}
    @animals.each {|animal| animal.eat}
    @animals.each {|animal| animal.sleep}
  end

  def new_organism(type, name)
    if type == :animal
      @animal_class.new name
    elsif type == :plant
      @plant_class.new name
    end
  end
end

pond = Habitat.new(Duck, 2, Algae, 1)
pond.simulate_one_day()

jungle = Habitat.new(Tiger, 2, Tree, 1)
jungle.simulate_one_day()

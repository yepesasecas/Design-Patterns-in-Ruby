#  ----------------------------------------------------------------------------
#  Products
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
#  Abstract Factort
#  ----------------------------------------------------------------------------


class Habitat
  def initialize(number_animals, number_plants, organism_factory)
    @animals = []
    number_animals.times do |i|
      animal = organism_factory.new_animal("animal#{i}")
      @animals << animal
    end

    @plants = []
    number_plants.times do |i|
      plant = organism_factory.new_plant("plant#{i}")
      @plants << plant
    end
  end

  def simulate_one_day
    @plants.each {|plant| plant.grow}
    @animals.each {|animal| animal.speak}
    @animals.each {|animal| animal.eat}
    @animals.each {|animal| animal.sleep}
  end
end

#  ----------------------------------------------------------------------------
#  Concrete Factory
#  ----------------------------------------------------------------------------
class OrganismFactory
  def initialize(plant_class, animal_class)
    @plant_class = plant_class
    @animal_class = animal_class
  end
  def new_plant(name)
    @plant_class.new(name)
  end

  def new_animal(name)
    @animal_class.new(name)
  end
end

#  ----------------------------------------------------------------------------
#  Init
#  ----------------------------------------------------------------------------
pondOrganismFactory = OrganismFactory.new(Algae, Duck)
pond = Habitat.new(2, 1, pondOrganismFactory)
pond.simulate_one_day()

jungleOrganismFactory = OrganismFactory.new(Tree, Tiger)
jungle = Habitat.new(2, 1, jungleOrganismFactory)
jungle.simulate_one_day()

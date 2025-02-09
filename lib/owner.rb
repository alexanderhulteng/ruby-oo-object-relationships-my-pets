class Owner
  @@all = []
  attr_reader :name, :species

  def initialize(name)
    @name = name
    @species = "human"
    @@all << self
  end

  def say_species
    "I am a #{self.species}."
  end

  def self.all
    @@all
  end

  def self.count
    self.all.count
  end

  def self.reset_all
    self.all.clear
  end

  def cats
    Cat.all.select{|k| k.owner == self}
  end

  def dogs
    Dog.all.select{|k| k.owner == self}
  end

  def buy_cat(name)
    Cat.new(name, self)
  end

  def buy_dog(name)
    Dog.new(name, self)
  end

  def walk_dogs
    self.dogs.each do |k|
      k.mood = "happy"
    end
  end

  def feed_cats
    self.cats.each do |l|
      l.mood = "happy"
    end
  end

  def sell_pets
    content = self.dogs + self.cats
    content.each do |k| 
      k.mood = "nervous"
      k.owner = nil
    end
  end

  def list_pets
    "I have #{self.dogs.count} dog(s), and #{self.cats.count} cat(s)."
  end


      





end
class TodaysCoffeeCli::Coffee
  
  attr_accessor :name, :prep_time, :ingredients, :description, :instructions 
  @@all = []
  
  def initialize 
    @@all << self 
  end
  
  def self.all
    @@all 
  end
end

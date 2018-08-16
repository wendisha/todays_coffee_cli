class Coffee::CLI
  attr_accessor :name, :prep_time, :ingredients, :description, :instructions 
  
  def self.coffee_types
    coffee_all = [] 
    deals << self.scrape_cafepoint
    deals
  end
  
  def self.scrape_cafepoint
    doc = Nokogiri::HTML(open("http://www.cafepoint.co.uk/different-types-of-coffee/"))
    coffee = self.new
    coffee.name =
    coffee.prep_time =
    coffee.ingredients = 
    coffee.description =
    coffee.instructions =
    coffee_all
  end
end
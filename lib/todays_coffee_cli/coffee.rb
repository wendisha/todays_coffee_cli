require "pry"
class TodaysCoffeeCli::Coffee
  attr_accessor :name, :prep_time, :ingredients, :description, :instructions 
  
 # def self.coffee_types
    #coffee_all = [] 
    #coffee_all << self.scrape_cafepoint
    #coffee_all
  #end
  
  def self.scrape_cafepoint
    @new_doc = []
    doc = Nokogiri::HTML(open("http://www.cafepoint.co.uk/different-types-of-coffee/"))
    @new_doc = doc.search("div.col-md-3").text.to_s.gsub(/\n/, " ").strip.gsub(/\s{2,}/, ",").split(",")
    coffee = self.new
    new_doc.each do |x|
      coffee.name = x
      coffee.prep_time = doc.search("div.col-md-9").text
      binding.pry
    end
    
    coffee.prep_time =
      coffee.ingredients = 
      coffee.description =
      coffee.instructions =
      
    coffee
    new_doc
    
    
  end
end
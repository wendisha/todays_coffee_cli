require "pry"
class TodaysCoffeeCli::Coffee
  attr_accessor :name, :prep_time, :ingredients, :description, :instructions 
  
 # def self.coffee_types
    #coffee_all = [] 
    #coffee_all << self.scrape_cafepoint
    #coffee_all
  #end
  
  def self.scrape_cafepoint
    new_doc = []
    doc = Nokogiri::HTML(open("http://www.cafepoint.co.uk/different-types-of-coffee/"))
    #new_doc = doc.search("div.col-md-3").text.to_s.gsub(/\n/, " ").strip.gsub(/\s{2,}/, ",").split(",")
    coffee_cards = doc.css(".col-md-9 section")
    coffee_cards.each do |card|
      coffee = self.new
      coffee.name = card.attributes["id"].value 
      coffee.prep_time = card.css("p").children[1].inner_text
      coffee.ingredients = card.css("ul").first.inner_text
      coffee.description = card.children[7].text #card.css("p")[1].text
      coffee.instructions = card.css("ul")[1].inner_text
      binding.pry 
    end
    
    
    #coffee
    #new_doc
    end
  end
  end
end
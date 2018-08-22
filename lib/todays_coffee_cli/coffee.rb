require "pry"
class TodaysCoffeeCli::Coffee
  attr_accessor :name, :prep_time, :ingredients, :description, :instructions 
  
 # def self.coffee_types
    #coffee_all = [] 
    #coffee_all << self.scrape_cafepoint
    #coffee_all
  #end
  
  def self.scrape_cafepoint
    coffee_types = []
    doc = Nokogiri::HTML(open("http://www.cafepoint.co.uk/different-types-of-coffee/"))
    coffee_cards = doc.css(".col-md-9 section")
    coffee_cards.each do |card|
      coffee = self.new
      coffee.name = card.attributes["id"].value 
      coffee.prep_time = card.css("p").children[1].inner_text.strip
      coffee.ingredients = card.css("ul").first.inner_text
      coffee.description = card.children[7].text #card.css("p")[1].text
      coffee.instructions = card.css("ul")[1].inner_text
      coffee_types << coffee
      binding.pry
    end
    coffee_types
    #binding.pry
  end
end

#new_doc = []
#new_doc = doc.search("div.col-md-3").text.to_s.gsub(/\n/, " ").strip.gsub(/\s{2,}/, ",").split(",")
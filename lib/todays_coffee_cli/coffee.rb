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
    new_doc = doc.search("div.col-md-3").text.to_s.gsub(/\n/, " ").strip.gsub(/\s{2,}/, ",").split(",")
    
    #coffee = self.new
    #new_doc.each do |x|
      #coffee.name = x
      #FRAPPUCCINO
      frap_p = doc.search("#FRAPPUCCINO p").text
      frap_ul = doc.search("#FRAPPUCCINO ul").text
      coffee.prep_time = frap_p[1..11]
      coffee.ingredients = frap_p[241..298]+frap_ul[0..168]
      coffee.description = frap_p[61..240]
      coffee.instructions = frap_p[299..345]+frap_ul[169..701]
      binding.pry
      
    #coffee
    #new_doc
    end
end
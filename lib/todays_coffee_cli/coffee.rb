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
    
    coffee = self.new
    new_doc.each do |x|
      #coffee.name = x
      #FRAPPUCCINO
      if x == "FRAPPUCCINO"
      frap_p = doc.search("#FRAPPUCCINO p").text
      frap_ul = doc.search("#FRAPPUCCINO ul").text
      coffee.prep_time = frap_p[1..11]
      coffee.ingredients = frap_p[241..298]+frap_ul[0..168]
      coffee.description = frap_p[61..240]
      coffee.instructions = frap_p[299..345]+frap_ul[169..701]
      
      elsif x == "CARAMEL MACCHIATO"
      car_p = doc.search("#CARAMEL-MACCHIATO p").text
      car_ul = doc.search("#CARAMEL-MACCHIATO ul").text
      coffee.prep_time = car_p[1..7]
      coffee.ingredients = car_p[364..384]+car_ul[0..134]
      coffee.description = car_p[63..295]
      coffee.instructions = car_p[385..417]+car_ul[135..321]
      
      elsif x == "CAFÉ MOCHA"
      car_p = doc.search("#CAFE-MOCHA p").text
      car_ul = doc.search("#CAFE-MOCHA ul").text
      coffee.prep_time = car_p[1..7]
      coffee.ingredients = car_p[448..467]+car_ul[1..166]
      coffee.description = car_p[87..311]
      coffee.instructions = car_p[468..512]+car_ul[169..703]
      
      elsif x == "AMERICANO"
      ame_p = doc.search("#AMERICANO p").text
      ame_ul = doc.search("#AMERICANO ul").text
      coffee.prep_time = ame_p[1..8]
      coffee.ingredients = ame_p[296..434]+ame_ul[1..18]
      coffee.description = ame_p[29..295]
      coffee.instructions = ame_p[435..503]+ame_ul[21..328]
      binding.pry
      
    #coffee
    #new_doc
    end
  end
  end
end
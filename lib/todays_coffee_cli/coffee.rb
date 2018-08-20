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
      cm_p = doc.search("#CAFE-MOCHA p").text
      cm_ul = doc.search("#CAFE-MOCHA ul").text
      coffee.prep_time = cm_p[1..7]
      coffee.ingredients = cm_p[448..467]+cm_ul[1..166]
      coffee.description = cm_p[87..311]
      coffee.instructions = cm_p[468..512]+cm_ul[169..703]
      
      elsif x == "AMERICANO"
      ame_p = doc.search("#AMERICANO p").text
      ame_ul = doc.search("#AMERICANO ul").text
      coffee.prep_time = ame_p[1..8]
      coffee.ingredients = ame_p[296..434]+ame_ul[1..18]
      coffee.description = ame_p[29..295]
      coffee.instructions = ame_p[435..503]+ame_ul[21..328]
      
      elsif x == "TURKISH COFFEE"
      tc_p = doc.search("#TURKISH-COFFEE p").text
      tc_ul = doc.search("#TURKISH-COFFEE ul").text
      coffee.prep_time = tc_p[1..8]
      coffee.ingredients = tc_p[348..368]+tc_ul[1..91]
      coffee.description = tc_p[47..347]
      coffee.instructions = tc_p[369..382]+tc_ul[94..832]
      
      elsif x == "CAFE CUBANO"
      cc_p = doc.search("#CAFE-CUBANO p").text
      cc_ul = doc.search("#CAFE-CUBANO ul").text
      coffee.prep_time = cc_p[1..7]
      coffee.ingredients = cc_p[405..489]+cc_ul[1..72]
      coffee.description = cc_p[36..404]
      coffee.instructions = cc_p[490..529]+cc_ul[74..831]
      
      elsif x == "CAFÉ LATTE"
      cl_p = doc.search("#CAFE-LATTE p").text
      cl_ul = doc.search("#CAFE-LATTE ul").text
      coffee.prep_time = cl_p[1..6]
      coffee.ingredients = cl_p[293..421]+cl_ul[1..130]
      coffee.description = cl_p[44..292]
      coffee.instructions = cl_p[422..435]+cl_ul[133..788]
      binding.pry
      
    #coffee
    #new_doc
    end
  end
  end
end
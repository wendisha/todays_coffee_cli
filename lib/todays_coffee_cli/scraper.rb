class TodaysCoffeeCli::Scraper

  def self.scrape_cafepoint
    doc = Nokogiri::HTML(open("http://www.cafepoint.co.uk/different-types-of-coffee/"))
    coffee_cards = doc.css(".col-md-9 section")
    coffee_cards.each do |card|
      coffee = TodaysCoffeeCli::Coffee.new
      coffee.name = card.children[1].text                               
      coffee.prep_time = card.css("p").children[1].inner_text.strip
      coffee.description = card.children[7].text                       
      if coffee.name == "ICED COFFEE"
        coffee.instructions = card.css("ul").first.inner_text
        coffee.ingredients = card.css("p").children[4].text 
      else
        coffee.ingredients = card.css("ul").first.inner_text
        coffee.instructions = card.css("ul")[1].inner_text
      end
    end
  end
end
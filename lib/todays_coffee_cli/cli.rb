#Needs to be fixed: Giving the option to get another coffee after getting info about one. Giving the option to exit while in second menu (list of coffee) and random coffee, if not, it should exit with the goodbye method.
require "pry"

class TodaysCoffeeCli::CLI
  
  def greeting 
    input = nil
    puts <<-DOC.gsub /^\s*/, ''
    .                                                                          .
    ------------------  Welcome to your daily cup of coffee!  ------------------
    Would you like to choose from a list of different types of coffee or are you 
    feeling lucky? Type L for list, R for a random choice or E to exit.
    .                                                                          .
    DOC
    input = gets.strip.upcase
    if input == "L"
      coffee_list
    elsif
      input == "R"
      random_coffee
    elsif
      input == "E"
        goodbye
    else 
       puts "Please make a valid selection."
       greeting
    end
  end 
  
  
  def coffee_list 
    answer = nil
    puts <<-DOC.gsub /^\s*/, ''
    1.FRAPPUCCINO     #not hardcoded, from scraping
    2.CARAMEL MACCHIATO
    3.CAFÉ MOCHA
    4.AMERICANO
    5.TURKISH COFFEE
    6.CAFE CUBANO
    7.CAFÉ LATTE
    8.IRISH COFFEE
    9.ESPRESSO
    10.CORTADO
    11.AFFOGATO
    12.CAPPUCCINO
    13.GOOD OLD PLAIN COFFEE 
    14.ICED COFFEE 
    15.CAFÉ AU LAIT
    
    Which coffee type would you like to know more about? 
    Please type the corresponding number, or type B to go back to the previous menu.
    DOC
    answer = gets.strip.upcase
    
    if answer.to_i > 0 && answer.to_i <= 15
      coffee_details(answer)
    elsif 
      answer == "B"
      greeting
    else 
      puts "Let's try that again."
      coffee_list
    end
  end


  def random_coffee
    answer_r = rand(1..15)
    coffee_details(answer_r)
  end
  
  
  def coffee_details(answer)
    coffees = TodaysCoffeeCli::Coffee.scrape_cafepoint
    the_coffee = coffees[answer.to_i-1]
    puts "Coffee Type:  #{the_coffee.name}"
    puts "Preparation Time:  #{the_coffee.prep_time}"
    puts "Ingredients:  #{the_coffee.ingredients}"
    puts "Description:  #{the_coffee.description}"
    puts "Instructions:  #{the_coffee.instructions}"
  end 
  
  
  def goodbye
    puts "Hope you enjoyed Today's Coffee! See you tomorrow!"
  end
end
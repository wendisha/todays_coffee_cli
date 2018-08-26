#Spaces
#Needs to be fixed: Giving the option to get another coffee after getting info about one. Giving the option to exit while in second menu (list of coffee) and random coffee, if not, it should exit with the goodbye method.
require "pry"

class TodaysCoffeeCli::CLI
  @@coffees = TodaysCoffeeCli::Coffee.scrape_cafepoint
  def greeting 
    input = nil
    while input != "E"
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
      elsif input == "R"
        random_coffee
      else 
        puts "Please make a valid selection."
      end
    end
    goodbye
  end 
  
  
  def coffee_list 
    answer = nil
    @@coffees.each.with_index(1) do |coffee, index|
      puts "#{index}. #{coffee.name}"
    end
    puts "Which coffee type would you like to know more about? Type the number, B to go back or E to exit."
    answer = gets.strip.upcase
    if answer.to_i > 0 && answer.to_i <= 15
      coffee_details(answer)
    elsif answer == "B"
      greeting
    else 
      puts "Let's try that again."
    end
  end


  def random_coffee
    answer_r = rand(1..15)
    coffee_details(answer_r)
  end
  
  
  def coffee_details(answer)
    the_coffee = @@coffees[answer.to_i-1]
    puts "Coffee Type:  #{the_coffee.name}"
    puts "Preparation Time:  #{the_coffee.prep_time}"
    puts "Ingredients:  #{the_coffee.ingredients}"
    puts "Description:  #{the_coffee.description}"
    puts "Instructions:  #{the_coffee.instructions}"
  end 
  
  
  def goodbye
    puts "Hope you enjoyed Today's Coffee! See you tomorrow!"
    exit
  end
end
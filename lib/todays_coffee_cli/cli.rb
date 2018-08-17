#Needs to be fixed: Giving the option to get another coffee after getting info about one. Giving the option to exit while in second menu (list of coffee) and random coffee, if not, it should exit with the goodbye method.

class TodaysCoffeeCli::CLI
  def greeting 
    input = nil
    puts <<-DOC.gsub /^\s*/, ''
    Welcome to your daily cup of coffee!
    Would you like to choose from a list of different types of delicious coffee or  are you feeling lucky? Type L for list, R for a random choice or E to exit.
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
    @coffee_all = TodaysCoffeeCli::Coffee.coffee_types
  end 
  
  def coffee_list 
    answer = nil
    puts <<-DOC.gsub /^\s*/, ''
    1.FRAPPUCCINO
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
 
    case answer 
    when "1"
      puts "More info on coffe 1."
    when "2"
      puts "More info on coffe 2."
    when "3"
      puts "More info on coffe 3."
    when "4"
      puts "More info on coffe 4."
    when "5"
      puts "More info on coffe 5."
    when "6"
      puts "More info on coffe 6."
    when "7"
      puts "More info on coffe 7."
    when "8"
      puts "More info on coffe 8."
    when "9"
      puts "More info on coffe 9."
    when "10"
      puts "More info on coffe 10."
    when "11"
      puts "More info on coffe 11."
    when "12"
      puts "More info on coffe 12."
    when "13"
      puts "More info on coffe 13."
    when "14"
      puts "More info on coffe 14."
    when "15"
      puts "More info on coffe 15."
    when "B"
      greeting
    else 
      puts "Let's try that again."
      coffee_list
   end
  end

  
  def random_coffee
    answer_r = rand(1..15)
    puts "More info about coffee #{answer_r}"
  end
  
  def goodbye
    puts "Hope you enjoyed Today's Coffee! See you tomorrow!"
  end
end
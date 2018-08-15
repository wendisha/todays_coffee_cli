class TodaysCoffeeCli::CLI
  def call 
    greeting
  end
  
  def greeting 
    input = nil
    puts <<-DOC
    Welcome to your daily cup of coffee!
    Would you like to choose from a list of different types of coffee or are you feeling lucky? Type L for list or R for a random choice.
    DOC
    input = gets.strip
    if input == "L" || input == "l"
      coffee_list
    else 
      random_coffee
    end
  end 
  
  def coffee_list 
    answer = nil
    puts <<-DOC
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
    answer = gets.strip 
    if answer == B || answer == b
      greeting
    elsif 
      answer
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
    else 
      puts "Let's try that again."
    end
  end
  
  def random_coffee 
  end
end
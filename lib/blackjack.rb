require 'pry'
def welcome
  puts "Welcome to the Blackjack Table"
end

# def cards
#   cards = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 10, 10, 10, 11
#           1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 10, 10, 10, 11
#           1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 10, 10, 10, 11
#           1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 10, 10, 10, 11]
  
#   binding.pry
# end

def deal_card
  cards = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 10, 10, 10, 11,
           1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 10, 10, 10, 11,
           1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 10, 10, 10, 11,
           1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 10, 10, 10, 11]
  cards.sample
  #rand(1..11)
end

def display_card_total(total)
  puts "Your cards add up to #{total}"
end

def prompt_user
 puts "Type 'h' to hit or 's' to stay"
end

def get_user_input
  gets.chomp
end

def end_game(total)
  puts "Sorry, you hit #{total}. You busted!!! Thanks for playing!"
end

def initial_round
  #binding.pry
  card1 = deal_card
  card2 = deal_card
  sum = card1 + card2
  # sum = deal_card
  # sum += deal_card
  puts "You got dealt a #{card1} and a #{card2}"
  sleep(2)
  display_card_total(sum)
  sleep(2)
  
  if sum == 21
    puts "Blackjack!!!"
    exit!
  end
  
  

  sum
end

def initial_dealer
  dealer1 = deal_card
  dealer2 = deal_card
  dealer_sum = dealer1 + dealer2
  puts "The dealer is showing #{dealer2}"
  sleep(1)
  dealer_sum
end

def hit?(num)
  prompt_user
  @input = get_user_input
  if @input == "h" 
    new_card = deal_card
    puts "dealing new card"
    sleep(1)
    puts "you got dealt a #{new_card}"
    sleep(1)
    num += new_card
  end
 # num += new_card = deal_card if @input == "h" 
  
  while @input != "h" && @input != "s" do
    invalid_command
    prompt_user
    @input = get_user_input
  end
  num
end

def invalid_command
  puts "Please enter a valid command"
end

def dealer(num)
  puts "The dealer has #{num}"
  while num < 17 do
    sleep(1)
    puts "dealing new card.."
    sleep(1)
    new_card = deal_card
    puts "The dealer got a #{new_card}"
    sleep(1)
    num += new_card
   # puts "The dealer now has #{num}"
  end
  puts "the dealer now has #{num}"
  num

end
  

#####################################################
# get every test to pass before coding runner below #
#####################################################

def runner
  welcome 
  sleep(1)
  sum =  initial_round
  dealer_sum = initial_dealer
  
  sum = hit?(sum)
  display_card_total(sum)
  
  while @input == "h" do
    if sum > 21
      end_game(sum)
      exit!
    else
      sum = hit?(sum)
      display_card_total(sum)
    end
  end
  
  d = dealer(dealer_sum)
  
  if d > 21
    puts "the dealer busted! congratz!"
    #exit!
  elsif d == sum 
    puts "you pushed"
   # exit!
  elsif d > sum
    puts "the dealer won, sorry!"
   # exit!
  elsif d < sum
    puts "you're a winner!"
    #exit!
  end
    
  
  
  
  
  
  # while sum <= 21 do
  #   sum = hit?(sum)
  #   display_card_total(sum)
  # end
  
  # puts "you did great!"
  # end_game(sum)
end
    

require './lib/oystercard'

card = Oystercard.new
puts "bal on the card is #{card.balance}"
puts "top up card by: #{card.top_up(30)}"

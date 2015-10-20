require './lib/oystercard'

card = Oystercard.new
puts "bal on the card is #{card.balance}"
puts "top up card by: #{card.top_up(30)}"
puts "deduct card by: #{card.deduct(4.5)}"
puts "is the card is use? #{card.in_journey?}"
puts "changes status when you touch in? #{card.touch_in}"
puts "changes status when you touch out? #{card.touch_out}"

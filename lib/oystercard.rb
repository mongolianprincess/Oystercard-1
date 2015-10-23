require_relative 'station'
require_relative 'journey'

class Oystercard

  MAX_BALANCE = 90
  MIN_FARE = 1

  attr_reader :balance, :log, :station

  def initialize (journey_klass, balance = 0)
    @balance = balance
    @log = []
    @journey_klass = journey_klass
  end

  def top_up amount
    fail "Over maximum balance of #{MAX_BALANCE}" if full?(amount)
    @balance += amount
  end

  def touch_in(journey_klass,station)
    fail "you have insufficient funds, please top up by #{MIN_FARE}" if insufficient_balance?
    @journey = @journey_klass.new(station)
  end

  def touch_out(station)
    @journey.end_journey(station)
    deduct(@journey.fare)
    #@journey = @journey.end_journey(station)
    #@log << @journey
    @log << @journey
  end

=begin
  def balance
    @balance -= @journey.fare
  end

  def log
    @log << @journey
  end

=end
  private

  def full?(amount)
    @balance + amount > 90
  end

  def insufficient_balance?
    @balance < MIN_FARE
  end

  def deduct amount
    @balance -= amount
  end
end

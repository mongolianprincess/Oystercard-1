require_relative 'station'
require_relative 'journey'

class Oystercard

  MAX_BALANCE = 90
  MIN_FARE = 1

  attr_reader :balance, :log, :station

  def initialize (balance = 0)
    @balance = balance
    @log = []
    @journey = {}
    #@journey = Journey.new
    @station = nil
  end

  def top_up amount
    fail "Over maximum balance of #{MAX_BALANCE}" if full?(amount)
    @balance += amount
  end

  def touch_in(station)
    fail "you have insufficient funds, please top up by #{MIN_FARE}" if insufficient_balance?
    @journey[:entry_station] = station
    @station = station
    # @journey = @journey.start_station(station)
  end

  def touch_out(station)
    deduct MIN_FARE
    #@journey = @journey.end_journey(station)
    #@log << @journey
    @journey[:exit_station] = station
    @log << @journey
    @station = nil
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

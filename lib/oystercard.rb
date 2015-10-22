require_relative 'station'

class Oystercard

  MAX_BALANCE = 90
  MIN_FARE = 1


  attr_reader :balance, :log, :station

  def initialize (balance = 0)
    @balance = balance
    @log = []
    @journey = {}
    @journey_counter = 0
    @station = nil
  end

  def top_up amount
    fail "Over maximum balance of #{MAX_BALANCE}" if full?(amount)
    @balance += amount
  end

  def in_journey?
    @station ? true : false
    # so you are in journey when the value isn't nil
  end

  def touch_in(station)
    fail "you have insufficient funds, please top up by #{MIN_FARE}" if insufficient_balance?
    @journey[:entry_station] = station
    @station = station
  end

  def touch_out(station)
    deduct MIN_FARE
    # journey_counter += 1
    # key =
    @journey[:exit_station] = station
    @log << @journey
    @station = nil
  end

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

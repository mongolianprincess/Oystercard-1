class Oystercard

  MAX_BALANCE = 90
  MIN_FARE = 1

  attr_accessor :balance, :log
  attr_reader :entry_station, :log

  def initialize (balance = 0)
    @balance = balance
    @log = {}
    @journey_counter = 0
  end

  def top_up amount
    fail "Over maximum balance of #{MAX_BALANCE}" if @balance + amount > 90
    @balance += amount
  end

  def in_journey?
    @entry_station != nil
    # so you are in journey when the value isn't nil
  end

  def touch_in(station)
    fail "you have insufficient funds of: £#{@balance}" if @balance < MIN_FARE
    @entry_station = station
  end

  def touch_out(exit_station)
    deduct MIN_FARE
    # journey_counter += 1
    # key =
    @log[:journey] = [@entry_station, exit_station]
    @entry_station = nil
  end

  private

  def deduct amount
    @balance -= amount
  end
end

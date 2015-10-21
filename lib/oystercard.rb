class Oystercard

  MAX_BALANCE = 90
  MIN_FARE = 1

  attr_accessor :balance
  attr_reader :entry_station

  def initialize (balance = 0)
    @balance = balance
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

  def touch_out
    deduct MIN_FARE
    @entry_station = nil
  end

  private

  def deduct amount
    @balance -= amount
  end
end

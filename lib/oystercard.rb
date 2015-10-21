class Oystercard

  MAX_BALANCE = 90
  MIN_FARE = 1

  attr_accessor :balance
  attr_reader :in_journey

  def initialize (balance = 0)
    @balance = balance
    @in_journey = false
  end

  def top_up amount
    fail "Over maximum balance of #{MAX_BALANCE}" if @balance + amount > 90
    @balance += amount
  end



  def in_journey?
    @in_journey
  end

  def touch_in
    fail "you have insufficient funds of: £#{@balance}" if @balance < MIN_FARE
    @in_journey = true
  end

  def touch_out
    deduct MIN_FARE
    @in_journey = false
  end

private

def deduct amount
  @balance -= amount
end


end

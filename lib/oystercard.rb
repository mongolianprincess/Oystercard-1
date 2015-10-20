class Oystercard

  MAXIMUM_BALANCE = 90

  attr_reader :balance
  attr_reader :in_journey

  def initialize (balance = 0)
    @balance = balance
    @in_journey = false
  end

  def top_up amount
    fail "Over maximum balance of #{Oystercard::MAXIMUM_BALANCE}" if @balance + amount > 90
    @balance += amount
  end

  def deduct amount
    @balance -= amount
  end

  def in_journey?
    @in_journey
  end

  def touch_in
    fail "you have insufficient funds of #{balance}" if @balance == 0
    @in_journey = true
  end

  def touch_out
    @in_journey = false
  end


end

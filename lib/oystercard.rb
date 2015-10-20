class Oystercard

  MAXIMUM_BALANCE = 90

  attr_reader :balance

  def initialize (balance = 0)
    @balance = balance
  end

  def top_up amount
    fail "Over maximum balance of #{Oystercard::MAXIMUM_BALANCE}" if @balance + amount > 90
    @balance += amount
  end

  def deduct amount
    @balance -= amount
  end
end

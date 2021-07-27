class Oystercard
  
  attr_accessor :balance 
  MAXIMUM_BALANCE = 50
  MINIMUM_BALANCE = 1

  def initialize
    @balance = 0 
  end
    
  def top_up(amount)
    @upper_amount = amount
    raise "maximum balanced of $#{MAXIMUM_BALANCE} has been exceeded" if limit?
    @balance += @upper_amount
  end

  def deduct(amount)
    @balance -= amount
  end

  def touch_in
    raise "you need a minimum of $#{MINIMUM_BALANCE} balance for a single journey" if minimum?
    @in_journey = true
  end

  def touch_out
    @in_journey = false
  end

  def in_journey?
    @in_journey 
  end


  private
  def limit?
    (@balance + @upper_amount) > MAXIMUM_BALANCE
  end

  def minimum?
    @balance < MINIMUM_BALANCE
  end


    
end

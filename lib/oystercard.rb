class Oystercard
  
  attr_accessor :balance, :entry_station, :exit_station, :journeys
  MAXIMUM_BALANCE = 50
  MINIMUM_BALANCE = 1

  def initialize
    @balance = 0 
    @entry_station = nil
    @exit_station = nil
    @journeys = []
    @journey = {}

  end
    
  def top_up(amount)
    @upper_amount = amount
    raise "maximum balanced of $#{MAXIMUM_BALANCE} has been exceeded" if limit?
    @balance += @upper_amount
  end


  def touch_in(entry_station)
    raise "you need a minimum of $#{MINIMUM_BALANCE} balance for a single journey" if minimum?
    @entry_station = entry_station
  end

  def touch_out(exit_station)

    deduct(MINIMUM_BALANCE)
    

    @journey = {:entry_station => entry_station, :exit_station => exit_station}
    @journeys << @journey
    @exit_station = exit_station

    @entry_station = nil

  end

  def in_journey?
    !!entry_station 
    # in_journey will return true unless the value of entry_station is false or nil.
  end


  private
  def limit?
    (@balance + @upper_amount) > MAXIMUM_BALANCE
  end

  def minimum?
    @balance < MINIMUM_BALANCE
  end

  def deduct(amount)
    @balance -= amount
  end



    
end

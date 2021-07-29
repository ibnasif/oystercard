class Journey 
  attr_accessor :exit_station, :entry_station
  PENALTY_FARE = 6

  def initialize
    @entry_station = nil
    @exit_station = nil
  end

  def not_complete?
    @entry_station == nil or @exit_station == nil
  end

  def fare
    PENALTY_FARE
  end

  def finish(station)
    return self
  end


end



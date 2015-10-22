class Journey

attr_reader :journey, :entry_station, :exit_station

MIN_FARE = 1
DEFAULT_PENALTY = 6

def initialize(station=nil)
  @complete = false
  @entry_station = station
  @exit_station = nil
end

def start_journey(station=nil)
  @entry_station = station
end

def end_journey(station=nil)
  @exit_station = station
  @complete = true if (@exit_station && @entry_station)
  self
end

def complete?
  @complete
end

def fare
  complete? ? MIN_FARE : DEFAULT_PENALTY
end

end

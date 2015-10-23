class Journey

attr_reader :journey, :entry_station, :exit_station

MIN_FARE = 1
DEFAULT_PENALTY = 6

def initialize(station)
  @complete = false
  @entry_station = station
  @exit_station
end

def start_journey(station)

end

def end_journey(station)
  @exit_station = station
  @complete = true if exit_station
end

def complete?
  @complete
end

def fare
  complete? ? MIN_FARE : DEFAULT_PENALTY
end

end

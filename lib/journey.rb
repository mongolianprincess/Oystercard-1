class Journey

attr_reader :journey, :station, :complete

MIN_FARE = 1
DEFAULT_PENALTY = 6

def initialize(station=nil)
  @complete = false
  @station = station
end

def entry_station(station)
  @station = station
end

def exit_station(exit_station=nil)
  @station = exit_station
  @complete = true
end

def complete?
  

def fare
  if @entry_station == nil && @exit_station != nil
    DEFAULT_PENALTY
  elsif @entry_station == nil && @exit_station != nil
    DEFAULT_PENALTY
  else
  MIN_FARE
  end
end

end

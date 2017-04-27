class Journey
  def initialize
    @hash = {}
  end

  def add_entry_station(station)
    @hash[:entry] = station
  end

  def entry_station
    @hash[:entry]
  end
end

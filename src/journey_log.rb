class JourneyLog
  def initialize
    @journeys = []
  end

  def all_with_entry_station(station)
    @journeys.select do |journey|
      journey.entry_station == station
    end
  end

  def add_journey(journey)
    @journeys << journey
  end
end

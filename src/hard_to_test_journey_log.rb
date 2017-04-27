require_relative './journey'

class HardToTestJourneyLog
  def initialize(journey_class = Journey)
    journey_1 = journey_class.new
    journey_1.add_entry_station(:barbican)
    journey_2 = journey_class.new
    journey_2.add_entry_station(:barbican)
    journey_3 = journey_class.new
    journey_3.add_entry_station(:kings_cross)
    @journeys = [
      journey_1,
      journey_2,
      journey_3
    ]
  end

  def all_with_entry_station(station)
    @journeys.select do |journey|
      journey.entry_station == station
    end
  end
end

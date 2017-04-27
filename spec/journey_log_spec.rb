require_relative '../src/journey_log'

# class FakeJourney
#   def add_entry_station(entry_station)
#   end
#
#   def entry_station
#     :barbican
#   end
# end

describe JourneyLog do
  describe "#all_with_entry_station" do
    it "does not throw an exception" do
      expect { subject.all_with_entry_station(:barbican) }.not_to raise_error
    end

    it "returns matching stations" do
      barbican_journey_1 = double :journey, entry_station: :barbican
      barbican_journey_2 = double :journey, entry_station: :barbican
      subject.add_journey(barbican_journey_1)
      subject.add_journey(barbican_journey_2)
      result = subject.all_with_entry_station(:barbican)
      expect(result).to eq [
        barbican_journey_1,
        barbican_journey_2
      ]
    end

    it "does not return unmatching stations" do
      barbican_journey = double :journey, entry_station: :barbican
      kings_cross_journey = double :journey, entry_station: :kings_cross
      subject.add_journey(barbican_journey)
      subject.add_journey(kings_cross_journey)
      result = subject.all_with_entry_station(:kings_cross)
      expect(result).to eq [
        kings_cross_journey
      ]
    end
  end
end

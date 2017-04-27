require_relative '../src/hard_to_test_journey_log'

## We started off with a 'crude double' using a new class
# class FakeJourney
#   def add_entry_station(entry_station)
#   end
#
#   def entry_station
#     :barbican
#   end
# end

describe HardToTestJourneyLog do
  describe "#all_with_entry_station" do
    it "does not throw an exception" do
      expect { subject.all_with_entry_station(:barbican) }.not_to raise_error
    end

    it "returns matching stations" do
      journey_double = double :journey
      allow(journey_double).to receive(:add_entry_station)
      allow(journey_double).to receive(:entry_station) { :barbican }
      journey_class_double = double :journey_class, new: journey_double
      subject = HardToTestJourneyLog.new(journey_class_double)
      result = subject.all_with_entry_station(:barbican)
      expect(result).to eq [journey_double, journey_double, journey_double]
    end

    it "does not return unmatching stations" do
      journey_double = double :journey
      allow(journey_double).to receive(:add_entry_station)
      allow(journey_double).to receive(:entry_station) { :barbican }
      journey_class_double = double :journey_class, new: journey_double
      subject = HardToTestJourneyLog.new(journey_class_double)
      result = subject.all_with_entry_station(:farringdon)
      expect(result).to eq []
    end
  end
end

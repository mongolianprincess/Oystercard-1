require './lib/journey'

describe Journey do

  let(:station) { double(:station) }
  let(:journey) { described_class.new(station)}

  it 'knows a journey is not complete' do
    expect(journey).not_to be_complete
  end

  it 'knows when a journey is complete' do
    journey.end_journey(station)
    expect(journey).to be_complete
  end

  context 'when given an entry station' do

      it "records entry station at start of journey" do
        expect(journey.entry_station).to eq station
      end
  end

  context 'when given an exit station' do

    it "records exit station at end of journey" do
      journey.end_journey(station)
      expect(journey.exit_station).to eq station
    end
  end

   describe '#fare' do

    context 'when both entry and exit station are provided' do

      it "returns minimum fare" do
        journey.end_journey(station)
        expect(journey.fare).to eq Journey::MIN_FARE
      end
    end

    context 'when entry or exit station is not provided' do

      it "has a default penalty fare when exit station not specified" do
        expect(journey.fare).to eq Journey::DEFAULT_PENALTY
      end
    end
  end

end

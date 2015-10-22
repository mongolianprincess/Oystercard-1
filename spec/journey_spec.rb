require './lib/journey'

describe Journey do

  let(:station) { double(:station) }

  it 'knows a journey is not complete' do
    expect(subject).not_to be_complete
  end

  context 'when given an entry station' do

      it "records entry station at start of journey" do
        subject.start_journey(station)
        expect(subject.entry_station).to eq station
      end
  end

  context 'when given an exit station' do

    it "records exit station at end of journey" do
      subject.end_journey(station)
      expect(subject.exit_station).to eq station
    end
  end

   describe '#fare' do

    context 'when both entry and exit station are provided' do

      it "returns minimum fare" do
        subject.start_journey(station)
        subject.end_journey(station)
        expect(subject.fare).to eq Journey::MIN_FARE
      end
    end

    context 'when entry or exit station is not provided' do

      it "has a default penalty fare when exit station not specified" do
        subject.start_journey(station)
        subject.end_journey
        expect(subject.fare).to eq Journey::DEFAULT_PENALTY
      end

      it "has a default penalty fare when entry station not specified" do
        subject.start_journey
        subject.end_journey(station)
        expect(subject.fare).to eq Journey::DEFAULT_PENALTY
      end
    end
  end

end

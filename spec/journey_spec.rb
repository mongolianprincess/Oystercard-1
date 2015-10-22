require './lib/journey'

describe Journey do

  let(:station) { double(:entry_station) }

  it 'knows a journey is not complete' do
    expect(subject.complete).to be_falsy
  end

  context 'when given an entry station' do

      it "records entry station at start of journey" do
        subject.entry_station(station)
        expect(subject.entry_station).to eq entry_station
      end
  end

  context 'when given an exit station' do

    it "records exit station at end of journey" do
      subject.exit_station(station)
      expect(subject.station).to eq station
    end
  end

   describe '#fare' do

    context 'when both entry and exit station are provided' do

      it "returns minimum fare" do
        subject.entry_station(station)
        subject.exit_station(station)
        expect(subject.fare).to eq Journey::MIN_FARE
      end
    end
    context 'when entry or exit station is not provided' do

      it "has a default penalty fare of £6" do
        subject.entry_station(station)
        subject.exit_station
        expect(subject.fare).to eq Journey::DEFAULT_PENALTY
      end
    end
  end

end

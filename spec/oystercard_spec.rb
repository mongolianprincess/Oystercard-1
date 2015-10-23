require 'oystercard'

describe Oystercard do

  let(:max) {Oystercard::MAX_BALANCE}
  let(:min) {Oystercard::MIN_FARE}
  let(:station) { double(:station, name: "Aldgate", zone: "1") }
  let(:journey) { double(end_journey: nil, fare: described_class::MIN_FARE) }
  let(:journey_klass) { double(new: journey)}
  let(:oystercard) { described_class.new(journey_klass, 0)}

  it 'balance is zero when initialized' do
    expect(oystercard.balance).to eq 0
  end

  describe '#top_up' do

    it 'balance increases by top up amount' do
      expect {oystercard.top_up 1}.to change{oystercard.balance}.by 1
    end
    it 'error if over maximum balance' do
      error = "Over maximum balance of #{max}"
      expect { oystercard.top_up(max + 1)}.to raise_error error
    end
  end

  describe '#touch_in' do

      before 'checks balance before use' do
        oystercard.top_up(1)
      end

      it 'checks you cant touch in with less than minimum balance' do
        oystercard.touch_in(journey_klass,station)
        oystercard.touch_out(station)
        error2 = "you have insufficient funds, please top up by #{min}"
        expect {oystercard.touch_in(journey_klass,station)}.to raise_error error2
      end

      it 'touching in provides journey with an entry station' do
        allow(journey).to receive(:station)
        #oystercard.touch_in(journey_klass, station)
        #expect(oystercard.in_journey?).to eq true
      end
    end

    describe '#touch_out' do

      before(:each) do
        oystercard.top_up(1)
        oystercard.touch_in(journey_klass, station)
      end

      it 'check balance changes at touch out by minimum balance' do
        expect { oystercard.touch_out(station) }.to change{ oystercard.balance }.by(-min)
      end

      it 'touching out changes journey status to not be in journey' do
        #oystercard.touch_out(station)
        #expect(oystercard.in_journey?).to eq false
      end

    let(:journey){ {:entry_station => station, :exit_station => station} }

    it 'checks touching out logs the journey' do
      oystercard.touch_out(station)
      expect(oystercard.log).to eq [journey]
    end

    it 'forgets the entry station upon touching out' do
      oystercard.touch_out(station)
      expect(oystercard.station).to eq nil
    end
  end


end

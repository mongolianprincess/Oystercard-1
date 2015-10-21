require 'oystercard'

describe Oystercard do

  let(:max) {Oystercard::MAX_BALANCE}
  let(:min) {Oystercard::MIN_FARE}
  let(:station) { double(:station) }
  let(:exit_station) {double(:exit_station)}

  it 'balance is zero when initialized' do
    expect(subject.balance).to eq 0
  end

  it 'checks an initial empty journey log is created' do
    expect(subject.log).to eq Hash.new
  end

  describe '#top_up' do
    it 'balance increases by top up amount' do
      expect {subject.top_up 1}.to change{subject.balance }.by 1
    end
    it 'error if over maximum balance' do
      error = "Over maximum balance of #{max}"
      expect { subject.top_up(max + 1)}.to raise_error error
    end
  end

  describe '#in_journey' do
    it  {expect(subject).not_to be_in_journey}
  end

    it 'checks you cant touch in with less than minimum balance' do
      error2 = "you have insufficient funds of: £#{subject.balance}"
      expect {subject.touch_in(station)}.to raise_error error2
    end

    it 'check balance changes at touch out by minimum balance' do
      expect { subject.touch_out(exit_station) }. to change{ subject.balance }.by(-min)
    end

  context 'Balance Query before touch in and out' do
    before 'checks balance before use' do
      subject.top_up(max)
    end

    describe '#touch_in' do
      it 'touching in changes journey status to be in journey' do
        subject.touch_in(station)
        expect(subject.in_journey?).to eq true
      end
    end

    describe '#touch_out' do
      it 'touching out changes journey status to not be in journey' do
        subject.touch_out(exit_station)
        expect(subject.in_journey?).to eq false
      end
    end
  end

  context '#journey log' do
      before(:each) do
        subject.top_up(50)
        subject.touch_in(station)
      end
    it {is_expected.to respond_to(:touch_in).with(1).argument}
    it 'logs the staion at the start of journey' do
      expect(subject.entry_station).to eq station
    end

    it 'checks touching out logs the journey' do
      subject.touch_out(exit_station)
      output = {:journey => [station, exit_station]}
      expect(subject.log).to eq output
    end

    it 'forgets the entry station upon touching out' do
      subject.touch_out(exit_station)
      expect(subject.entry_station).to eq nil
    end

  end


end

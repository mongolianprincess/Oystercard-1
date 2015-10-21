require 'oystercard'

describe Oystercard do

  let(:max) {Oystercard::MAX_BALANCE}
  let(:min) {Oystercard::MIN_FARE}
  it 'balance is zero when initialized' do
    expect(subject.balance).to eq 0
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
      expect {subject.touch_in}.to raise_error error2
    end

    it 'check balance changes at touch out by minimum balance' do
      expect { subject.touch_out }. to change{ subject.balance }.by(-min)
    end

  context 'Balance Query before touch in and out' do
    before 'checks balance before use' do
      subject.top_up(max)
    end

    describe '#touch_in' do
      it 'touching in changes journey status to be in journey' do
        subject.touch_in
        expect(subject.in_journey).to eq true
      end
    end

    describe '#touch_out' do
      it 'touching out changes journey status to not be in journey' do
        subject.touch_out
        expect(subject.in_journey).to eq false
      end
    end
  end

end

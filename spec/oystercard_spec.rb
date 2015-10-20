require 'oystercard'

describe Oystercard do
  it 'balance is zero when initialized' do
    expect(subject.balance).to eq 0
  end

  describe '#top_up' do
    it 'balance increases by top up amount' do
      expect {subject.top_up 1}.to change{subject.balance }.by 1
    end
    it 'error if over maximum balance' do
      max_balance = Oystercard::MAXIMUM_BALANCE + 1
      expect { subject.top_up(max_balance)}.to raise_error "Over maximum balance of #{Oystercard::MAXIMUM_BALANCE}"
    end
  end
  describe '#deduct'do
    it 'subtracts journey fare from balance' do
      subject.top_up(30)
      expect { subject.deduct(4.5) }. to change{ subject.balance }.by -4.5
    end
  end
  describe '#in_journey' do
    it  {expect(subject).not_to be_in_journey}
  end


    it 'checks minimum balance when touch in'do
      subject.balance = Oystercard::MINIMUM_BALANCE - 1
      expect {subject.touch_in}.to raise_error "you have insufficient funds of #{subject.balance}"
    end

  context 'Balance Query before touch in and out' do
    before 'checks balance before use' do
      subject.top_up(Oystercard::MAXIMUM_BALANCE)
    end

        describe '#touch_in' do
          it 'checks person can touch in and change card journey status' do
            subject.touch_in
            expect(subject.in_journey).to eq true
          end
        end

        describe '#touch_out' do
          it 'checks person can touch out and change card journey type' do
            subject.touch_out
            expect(subject.in_journey).to eq false
          end
        end

  end
end

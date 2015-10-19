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
      expect {subject.top_up (Oystercard::MAXIMUM_BALANCE +1)}.to raise_error "Over maximum balance of #{Oystercard::MAXIMUM_BALANCE}"
    end
  end
end

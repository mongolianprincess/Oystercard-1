require 'oystercard'
describe 'Feature test  - oystercard challenge' do

    subject {Oystercard.new}

      it 'balance is zero when initialized' do
        expect(subject.balance).to eq 0
      end

      describe '#top_up' do
        it 'balance increases by top up amount' do
          expect {subject.top_up 1}.to change{subject.balance}.by 1
        end
      end

      describe '#max_balance' do
        it 'error if over maximum balance' do
          max_balance = Oystercard::MAXIMUM_BALANCE
          expect {subject.top_up(max_balance +1)}.to raise_error "Over maximum balance of #{max_balance}"
        end

      end
end

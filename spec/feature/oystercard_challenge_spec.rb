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
end

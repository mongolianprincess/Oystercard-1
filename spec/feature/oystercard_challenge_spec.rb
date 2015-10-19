require 'oystercard'
describe 'oystercard challenge' do

subject {Oystercard.new}
  it 'balance is zero when initialized' do
    expect(subject.balance).to eq 0
  end

end
require "Oystercard"

describe Oystercard do
  
  it "has a balance" do
    expect(subject.balance).to eq(0)
  end

  it "can add money to the card" do
    subject.top_up(10)
    expect(subject.balance).to eq(10)
  end

  it "has a maximum balance" do
    maximum_balance = Oystercard::MAXIMUM_BALANCE
    subject.top_up(maximum_balance)
    expect{subject.top_up(1)}.to raise_error("maximum balanced of $#{maximum_balance} has been exceeded")
  end

  it "deducts money from the card" do
    subject.top_up(20)
    expect{subject.deduct(10)}.to change {subject.balance}.by -10
  end

  it "registers touch in" do
    subject.top_up(10)
    subject.touch_in
    expect(subject.in_journey?).to eq true
    
  end

  it "registers touch out" do
    subject.touch_out
    expect(subject.in_journey?).to eq false
  end

  it "has a minimum of $1 balance to touch in" do
    minimum_balance = Oystercard::MINIMUM_BALANCE
    expect{subject.touch_in}.to raise_error("you need a minimum of $#{minimum_balance} balance for a single journey")
  end
end

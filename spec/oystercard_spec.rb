require_relative "../lib/oystercard.rb"

describe Oystercard do

  let(:entry_station) {double :station}

  let(:exit_station) {double :station}
  
  
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

  #private method now

  #it "deducts money from the card" do
   # subject.top_up(20)
    #expect{subject.deduct(10)}.to change {subject.balance}.by -10
  #end

  it "registers touch in" do
    subject.top_up(10)
    subject.touch_in(entry_station)
    expect(subject.in_journey?).to eq true
    
  end

  it "registers touch out" do
    subject.touch_out(exit_station)
    expect(subject.in_journey?).to eq false
  end

  it "has a minimum of $1 balance to touch in" do
    minimum_balance = Oystercard::MINIMUM_BALANCE
    expect{subject.touch_in(entry_station)}.to raise_error("you need a minimum of $#{minimum_balance} balance for a single journey")
  end

  it "deducts correct amount from the card when the journey is complete" do
    subject.top_up(3)
    subject.touch_in(entry_station)
    expect{subject.touch_out(exit_station)}.to change{subject.balance}.by -Oystercard::MINIMUM_BALANCE
   end


  it "saves the entry stations, where you've travelled from" do
    subject.top_up(3)
    subject.touch_in(entry_station) 
    expect(subject.entry_station).to eq entry_station

  end

  it "saves the exit station" do
    subject.top_up(3)
    subject.touch_out(exit_station)
    expect(subject.exit_station).to eq exit_station
  end


  let(:journey){ [{entry_station: entry_station, exit_station: exit_station}] }
  
  it "stores the entry and exit stations in a hash" do
    subject.top_up(3)
    subject.touch_in(entry_station)
    subject.touch_out(exit_station)
    expect(subject.journeys).to eq journey
  end

  it "has an empty list of journeys by default" do
    expect(subject.journeys).to eq [] 
  end

end



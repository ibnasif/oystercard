require_relative "../lib/station.rb"

describe Station do
  
  it "gives a station's name" do
    station = Station.new("station", 100)
    expect(station.name).to eq "station"
    
  end

  it "gives a station's zone" do
    station = Station.new("station", 100)
    expect(station.zone).to eq 100

  end
  
end
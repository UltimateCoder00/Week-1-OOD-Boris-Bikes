require 'vans.rb'

describe Vans do

  it 'picks up broken bikes' do
    station = DockingStation.new
    10.times {station.dock(Bikes.new)}

    expect(subject.pickup(station.bikes)).to eq subject.broken_bikes
  end

end

require 'vans.rb'

describe Vans do

  it 'picks up any bikes' do
    station = DockingStation.new
    10.times {station.dock(Bikes.new)}
    10.times {station.dock(Bikes.new.report_broken)}
    p "========="
    p station.bikes
    p "========="

    expect(subject.pickup(station.release_broken_bikes)).to eq subject.broken_bikes
  end

end

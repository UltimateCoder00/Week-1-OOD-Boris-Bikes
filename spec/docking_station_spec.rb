require 'docking_station.rb'

describe DockingStation do
  it { is_expected.to respond_to :release_bike}

  # Write a feature test that allows a user to set a @capacity instance
  # variable when DockingStation.new is called.
  describe 'set capacity instance to DockingStation.new' do
    it 'has a default capacity' do
       expect(subject.capacity).to eq DockingStation::DEFAULT_CAPACITY
    end
  end

# subject creates an instance of that CLASS being tested
  describe '#release_bike' do
    it 'releases a bike' do
      bike = double(:bike, broken?: false)
      # allow(bike).to receive(:broken?).and_return(false)
      subject.dock(bike)
      expect(subject.release_bike).to eq bike
    end
  end

  describe '#release_bike' do
    it 'raises an error when bike method called on docking station equals empty array' do
      expect {subject.release_bike}.to raise_error "No bikes available"
    end

    it  'raises an error when broken bike is released' do
      bike = double(:bike, broken?: true, report_broken: true)
      # allow(bike).to receive(:broken?).and_return(true)
      # allow(bike).to receive(:report_broken).and_return(true)
      bike.report_broken
      subject.dock(bike)
      expect {subject.release_bike}.to raise_error "Bike is broken"
    end
  end

  describe '#dock' do
    it 'raises an error when a bike is attempted to dock in a docking station with 1 bike in.' do
      subject.capacity.times { subject.dock double(:bike) }
      expect {subject.dock(double(:bike))}.to raise_error "Docking Station Full!"
    end
  end

  describe 'initialize' do
    it 'has a variable capacpity' do
      docking_station = DockingStation.new(50)
      50.times { docking_station.dock double(:bike)}
      expect { docking_station.dock double(:bike) }.to raise_error 'Docking Station Full!'
    end

    subject { DockingStation.new}
    let(:bike) { double(:bike) }
    it 'defaults capacity' do
      DockingStation::DEFAULT_CAPACITY.times do #describe_class
        subject.dock(bike)
      end
      expect{ subject.dock(bike) }.to raise_error 'Docking Station Full!'
    end
  end

  # docking_station.dock(bike)
  # test that there there is a method and an argument is passed in when called
  it { is_expected.to respond_to(:dock).with(1).argument }

  # more closely resembles feature of above [dock(bike)]
  # return the bike we dock
  it 'docks something' do
    bike = double(:bike)
    expect(subject.dock(bike)).to eq [bike]
  end

  # docking1.bike
  # calling bike method on instance to return a docked bike
  # i.e a docked instance of the bike class
  # it { is_expected.to respond_to(:bike) }

  # more closely resembles feature of above
  # def bike
  it 'returns docked bikes' do
    bike = double(:bike)
    expect(subject.dock(bike)).to eq [bike]
  end
=begin
  describe 'Vans' do
    it 'Stores only working bikes after pickups' do
      bike = Bikes.new
      subject.dock(bike)
      subject.dock(Bikes.new.report_broken)
      van = Vans.new
      van.pickup(subject.bikes)
      expect(subject.bikes).to eq [bike]
    end
  end
=end

end

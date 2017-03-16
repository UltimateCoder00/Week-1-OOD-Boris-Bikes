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
      bike = Bikes.new
      subject.dock(bike)
      expect(subject.release_bike).to eq bike
    end
  end

  describe '#release_bike' do
    it 'raises an error when bike method called on docking station equals empty array' do
      expect {subject.release_bike}.to raise_error "No bikes available"
    end
  end

  describe '#dock' do
    it 'raises an error when a bike is attempted to dock in a docking station with 1 bike in.' do
      subject.capacity.times { subject.dock Bikes.new }
      expect {subject.dock(Bikes.new)}.to raise_error "Docking Station Full!"
    end
  end

  describe 'initialize' do
    it 'has a variable capacpity' do
      docking_station = DockingStation.new(50)
      50.times { docking_station.dock Bikes.new}
      expect { docking_station.dock Bikes.new }.to raise_error 'Docking Station Full!'
    end

    subject { DockingStation.new}
    let(:bike) { Bikes.new }
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
    bike = Bikes.new
    expect(subject.dock(bike)).to eq [bike]
  end

  # docking1.bike
  # calling bike method on instance to return a docked bike
  # i.e a docked instance of the bike class
  # it { is_expected.to respond_to(:bike) }

  # more closely resembles feature of above
  # def bike
  it 'returns docked bikes' do
    bike = Bikes.new
    expect(subject.dock(bike)).to eq [bike]
  end

end

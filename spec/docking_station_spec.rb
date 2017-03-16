require 'docking_station'

describe DockingStation do
  describe '#release_bike' do

    it 'releases a bike' do
      bike = Bike.new
      subject.dock(bike)
      expect(subject.release_bike).to eq bike
    end

    it 'raises an error when there are no bikes available' do
      expect{ subject.release_bike }.to raise_error 'No bikes available'
    end
  end

  describe '#dock' do
    it 'docking bike' do
      bike = Bike.new
      expect(subject.dock(bike)).to eq [bike]
    end

    it "raises an error when the docking station is full" do
      bike = Bike.new
      20.times { subject.dock Bike.new }
      expect {subject.dock(bike) }.to raise_error 'Docking station is full'
    end
  end

  it "checks if bike is working" do
    # expect(subject.release_bike).to be_working
  end

end



=begin

describe Bike do
it { is_expected.to respond_to :working?}
end

Shorter option:
describe DockingStation do
it { is_expected.to respond_to :release_bike}
end

#respond_to => The instance and method are connected.
#is_expected => What we are expecting to see in the programme.
#.to => To do something.
#:release_bike => A method.


#Note: Always run rspec from the project directory, not in spec or lib.

#Feature test is testing the interaction between the Object and Messages.
#Unit test is testing a slice of functionality in a system.

#Ruby errors are thrown when there is an issue with the syntax of a programme.
#Rspec failures occur when a unit test does not meet the requirements of the spec.

#in IRB, the path of the required file is neccessary e.g. ./lib/DockingStation
# Rspec automatically tells Ruby to look in the /lib directory

=end

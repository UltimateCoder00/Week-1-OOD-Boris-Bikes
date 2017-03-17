require_relative 'bike'

class DockingStation
  attr_reader :capacity, :bikes

  DEFAULT_CAPACITY = 20

# Use an initialize function to set the initial value of this attribute to an empty array.

  def initialize(capacity=DEFAULT_CAPACITY)
    @capacity = capacity
    @bikes = []
  end

  def count_bikes
    @bikes.count
  end

  def release_bike
    fail 'No bikes available' if empty?
    fail 'Bike is broken' if @bikes.last.broken?
    @bikes.pop
  end

  def release_broken_bikes
    broken_bikes = []
    fail 'No bikes available' if empty?
    @bikes.map do |bike|
      if bike.broken?
        broken_bikes << bike
        @bikes.delete(bike)
      end
    end
    broken_bikes
  end

# Rename your attribute @bike to reflect that it will store more than one Bike instance.

  def dock(bike)
    fail 'Docking Station Full!' if full?
    @bikes.push(bike) # or <<
  end

  #  Define a full? predicate method that uses some of the dock code
  # to return true or false depending on whether the station is full or not

  private

# attr_reader :bikes

    def full?
      @bikes.count >= capacity
    end

    def empty?
     @bikes.empty?
    end

=begin This is what attr_reader does - this is a getter
  def bike
    @bike
  end
=end

end

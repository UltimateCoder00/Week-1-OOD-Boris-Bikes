

class Vans

  attr_reader :broken_bikes

  def initialize
    @broken_bikes = []
  end

  def pickup(bikes)
    bikes.each { |bike| broken_bikes << bike if bike.broken? }
    broken_bikes
  end

end

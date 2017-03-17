

class Vans

  attr_reader :broken_bikes

  def initialize
    @broken_bikes = []
  end

  def pickup(bikes)
    bikes.map do |broken_bike|
      if broken_bike
        @broken_bikes << broken_bike
      end
    end

    puts @broken_bikes
    @broken_bikes
  end

end



class Vans

  attr_reader :broken_bikes

  def initialize
    @broken_bikes = []
  end

  def pickup(bikes)
    bikes.map! do |broken_bike|
      if broken_bike == true
        @broken_bikes << broken_bike
      end
    end
    @broken_bikes
  end


end

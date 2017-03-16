class Bikes
  
  def initialize(broken=false)
    @broken = broken
  end

  def working?
    true
  end

  def report_broken
    @broken = true
  end

  def broken?
    @broken
  end
end

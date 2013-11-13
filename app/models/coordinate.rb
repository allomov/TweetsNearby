class Coordinate
  attr_accessor :latitude, :longitude

  def initialize(attrs)
    @latitude  = attrs[:latitude]
    @longitude = attrs[:longitude]
  end

  def to_cl
    CLLocationCoordinate2D.new(latitude, longitude)
  end
end

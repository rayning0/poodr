# Testing duck types/roles (p. 219)

class Trip
  attr_reader :bicycles, :customers, :vehicle

  def initialize(args={})
    @bicycles  = args[:bicycles]  ||= []
    @customers = args[:customers] ||= []
    @vehicle   = args[:vehicle]
  end

  def prepare(preparers)
    preparers.each { |preparer| preparer.prepare_trip(self) }
  end
end

class Mechanic
  def prepare_trip(trip)
    trip.bicycles.each { |bicycle| prepare_bicycle(bicycle) }
  end
end

class TripCoordinator
  def prepare_trip(trip)
    buy_food(trip.customers)
  end
end

class Driver
  def prepare_trip(trip)
    vehicle = trip.vehicle
    gas_up(vehicle)
    fill_water_tank(vehicle)
  end
end
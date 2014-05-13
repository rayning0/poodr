# Testing duck types/roles (p. 219)

require_relative './minitest_helper'
require_relative '../lib/ch9e'

module PreparerInterfaceTest
  def test_implements_the_preparer_interface
    assert_respond_to(@object, :prepare_trip)
  end
end

############## Page 222 ##############
class MechanicTest < MiniTest::Test
  include PreparerInterfaceTest

  def setup
    @mechanic = @object = Mechanic.new
  end
  # other tests which rely on @mechanic
end

class TripCoordinatorTest < MiniTest::Test
  include PreparerInterfaceTest

  def setup
    @trip_coordinator = @object = TripCoordinator.new
  end
end

class DriverTest < MiniTest::Test
  include PreparerInterfaceTest

  def setup
    @driver = @object = Driver.new
  end
end

############## Page 223 ##############
class TripTest < MiniTest::Test

  def test_requests_trip_preparation
    @preparer = MiniTest::Mock.new
    @trip     = Trip.new
    # why does Minitest need [@trip] here but RSpec does not?
    @preparer.expect(:prepare_trip, nil, [@trip])

    @trip.prepare([@preparer])
    @preparer.verify
  end
end
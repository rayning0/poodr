# Using role/interface tests to validate doubles/mocks (p. 222)

require_relative './minitest_helper'
require_relative '../lib/ch9g'

module DiameterizableInterfaceTest
  def test_implements_the_diameterizable_interface
    assert_respond_to(@object, :diameter)
  end
end

class DiameterDouble
  def diameter
    10
  end
end

class DiameterDoubleTest < MiniTest::Test
  include DiameterizableInterfaceTest

  def setup
    @object = DiameterDouble.new
  end
end

class WheelTest < MiniTest::Test
  include DiameterizableInterfaceTest

  def setup
    @wheel = @object = Wheel.new(26, 1.5)
  end

  def test_calculates_diameter
    assert_in_delta(29,
                    @wheel.diameter,
                    0.01)
  end
end

class GearTest < MiniTest::Test
  def test_calculates_gear_inches
    gear =  Gear.new(
              chainring: 52,
              cog:       11,
              wheel:     DiameterDouble.new)

    assert_in_delta(47.27,
                    gear.gear_inches,
                    0.01)
  end
end
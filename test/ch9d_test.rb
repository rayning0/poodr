# Testing outgoing command messages w/ a MOCK observer (p.215)

require_relative './minitest_helper'
require_relative '../lib/ch9d'

class GearTest < MiniTest::Test

  def setup
    @observer = MiniTest::Mock.new
    @gear     = Gear.new(
                  chainring: 52,
                  cog:       11,
                  observer:  @observer)
  end

  def test_notifies_observers_when_cogs_change
    @observer.expect(:changed, true, [52, 27])
    @gear.set_cog(27)
    @observer.verify
  end

  def test_notifies_observers_when_chainrings_change
    @observer.expect(:changed, true, [42, 11])
    @gear.set_chainring(42)
    @observer.verify
  end
end
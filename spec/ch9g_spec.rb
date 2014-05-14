# Using role/interface tests to validate doubles/mocks (p. 222)

require 'spec_helper'
require_relative '../lib/ch9g'

shared_examples 'Diameterizable' do
  it { should respond_to(:diameter) }
end

class DiameterDouble
  def diameter
    10
  end
end

describe DiameterDouble do
  it_behaves_like 'Diameterizable'
  let(:object) { DiameterDouble.new }
end

describe Wheel do
  it_behaves_like 'Diameterizable'
  let(:wheel) { Wheel.new(26, 1.5) }
  subject { wheel }

  it 'calculates diameter' do
    expect(wheel.diameter).to eq(29)
  end
end

describe Gear do
  it 'calculates gear inches' do
    gear =  Gear.new(
              chainring: 52,
              cog:       11,
              wheel:     DiameterDouble.new)
    expect(gear.gear_inches).to be_within(0.01).of(47.27)
  end
end

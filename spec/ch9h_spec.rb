# Testing Inheritance (p. 228)
require 'spec_helper'
require_relative '../lib/ch9h'

############## Page 231 ##############
shared_examples 'Bicycle' do
  it { should respond_to(:default_tire_size) }
  it { should respond_to(:default_chain) }
  it { should respond_to(:chain) }
  it { should respond_to(:size) }
  it { should respond_to(:tire_size) }
  it { should respond_to(:spares) }
end

############## Page 233 ##############
shared_examples 'BicycleSubclass' do
  it { should respond_to(:post_initialize) }
  it { should respond_to(:local_spares) }
  it { should respond_to(:default_tire_size) }
end

############## Page 234 ##############
describe MountainBike do
  it_behaves_like 'Bicycle'
  it_behaves_like 'BicycleSubclass'
  let(:bike) { MountainBike.new }
end

############## Page 236 ##############
describe RoadBike do
  it_behaves_like 'Bicycle'
  it_behaves_like 'BicycleSubclass'
  let(:bike) { RoadBike.new(tape_color: 'red') }

  it 'puts tape color in local spares' do
    expect(bike.local_spares[:tape_color]).to eq('red')
  end
end

class StubbedBike < Bicycle
  def default_tire_size
    0
  end
  def local_spares
    {saddle: 'painful'}
  end
end

describe StubbedBike do
  it_behaves_like 'BicycleSubclass'
  let(:object) { StubbedBike.new }
end

############## Page 238 ##############
describe Bicycle do
  it_behaves_like 'Bicycle'
  let(:bike) { Bicycle.new({tire_size: 0}) }
  # if object has arguments, to check interface, always add "subject" line
  subject { bike }

  let(:stubbed_bike) { StubbedBike.new }

  it 'forces subclass to implement default tire size' do
    expect{ bike.default_tire_size }.to raise_error(NotImplementedError)
  end

  it 'includes local spares in spares' do
    expect(stubbed_bike.spares).to eq({ tire_size: 0,
      chain: '10-speed', saddle: 'painful' })
  end
end
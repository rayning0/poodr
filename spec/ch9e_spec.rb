# Testing duck types/roles/interfaces (p. 219)

require 'spec_helper'
require_relative '../lib/ch9e'

shared_examples 'Preparable' do
  it { should respond_to(:prepare_trip) }
end

describe Mechanic do
  it_behaves_like 'Preparable'
  let(:mechanic) { Mechanic.new }
  # other tests which rely on @mechanic
end

describe TripCoordinator do
  it_behaves_like 'Preparable'
  let(:trip_coordinator) { TripCoordinator.new }
end

describe Driver do
  it_behaves_like 'Preparable'
  let(:driver) { Driver.new }
end

describe Trip do
  let(:preparer) { double('preparer') }
  let(:trip) { Trip.new }

  it 'requests trip preparation' do
    # why does Minitest need [@trip] here but RSpec does not?
    expect(preparer).to receive(:prepare_trip).with(trip)
    trip.prepare([preparer])
  end
end
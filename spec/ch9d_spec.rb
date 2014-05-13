# Testing outgoing command messages w/ a MOCK observer (p.215)

require 'spec_helper'
require_relative '../lib/ch9d'

describe Gear do
  let(:observer) { double('observer') }
  let(:gear)     { Gear.new(
                   chainring: 52,
                   cog:       11,
                   observer:  observer) }

  it 'notifies observers when cogs change' do
    expect(observer).to receive(:changed).with(52, 27)
    gear.set_cog(27)
  end

  it 'notifies observers when chainrings change' do
    expect(observer).to receive(:changed).with(42, 11)
    gear.set_chainring(42)
  end
end
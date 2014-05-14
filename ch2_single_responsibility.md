Chp 2: Designing Class with a Single Responsibility
---------------------------------------------------
Single responsibility:

- "a class/module should have only one reason to change."
- If the simplest description you can devise uses the word “and,” the class likely has more than one responsibility. If it uses the word “or,” then the class has more than one responsibility and they aren’t even very related.
- SRP doesn’t require that a class do only one very narrow thing or that it change for only a single nitpicky reason, instead SRP requires that a class be cohesive— that everything the class does be highly related to its purpose.

Organizing Code to Allow for Easy Changes

Easy to Change:

  - Changes have no unexpected side effects
  - Small changes in requirements require correspondingly small changes in code
  - Existing code is easy to reuse
  - The easiest way to make a change is to add code that in itself is easy to change.

Code should be TRUE:

  - Transparent: The consequences of change should be obvious in the code that is changing and in distant code relies upon it
  - Reasonable: The cost of any change should be proportional to the benefits the change achieves
  - Usable: Existing code should be usable in new and unexpected contexts
  - Exemplary: The code itself should encourage those who change it to perpetuate these qualities

Depend on behavior, not data

  - Hide instance variables (use attr_accessor instead)
  - Hide data structures
    - Direct references into complicated structures are confusing, because they obscure what the data really is, and they are a maintenance nightmare, because every reference will need to be changed when the structure of the array changes.

Enforce single responsibility everywhere

  - Extract extra responsibilities from methods. Separate iteration (loop) from action (calculating diameter)
  - Benefits of SRP:
    - Expose previously hidden qualities
    - Avoid need for comments
    - Encourage reuse
    - Easy to move to another class
  - Isolate extra responsibilities in classes (or make Structs, temporarily)

Final code
```ruby
class Wheel
  attr_reader :rim, :tire

  def initialize(rim, tire)
    @rim       = rim
    @tire      = tire
  end

  def diameter
    rim + (tire * 2)
  end

  def circumference
    diameter * Math::PI
  end
end

class Gear
  attr_reader :chainring, :cog, :wheel
  def initialize(chainring, cog, wheel=nil)
    @chainring = chainring
    @cog       = cog
    @wheel     = Wheel  # Dependency for Wheel is INJECTED into Gear
  end

  def ratio
    chainring / cog.to_f
  end

  def gear_inches
    ratio * wheel.diameter
  end
end

@wheel = Wheel.new(26, 1.5)
puts @wheel.circumference
# -> 91.106186954104

puts Gear.new(52, 11, @wheel).gear_inches
# -> 137.090909090909

puts Gear.new(52, 11).ratio
# -> 4.72727272727273

OR

class Gear
  attr_reader :chainring, :cog, :wheel
  def initialize(args)
    @chainring = args[:chainring]
    @cog       = args[:cog]
    @wheel     = args[:wheel]   # dependency for Wheel is INJECTED into Gear
  end
# ...
end
```
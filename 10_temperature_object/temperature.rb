class Temperature
  def initialize(attrs={})
    @f = attrs[:f]
    @c = attrs[:c]
  end

  def ftoc (temp)
    (temp - 32.0 ) * 5.0 / 9.0
  end

  def ctof (temp)
    temp * 9.0 / 5.0 + 32.0
  end

  def in_celsius
    return @c if @c
    return ftoc(@f) if @f
  end

  def in_fahrenheit
    return @f if @f
    return ctof(@c) if @c
  end

  def self.from_celsius(c)
    Temperature.new(:c => c)
  end

  def self.from_fahrenheit(f)
    Temperature.new(:f => f)
  end
end

class Celsius < Temperature
  def initialize(temp)
      @c = temp
  end
end

class Fahrenheit < Temperature
    def initialize(temp)
      @f = temp
    end
end
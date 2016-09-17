class Timer
  attr_accessor :seconds
  def initialize
    @seconds = 0
  end

  def padded (x)
    x<10 ? sprintf('%1.2d', x) : x
  end

  def time_string
    s = @seconds % 60
    m = @seconds / 60 % 60
    h = @seconds / 3600
    @time_string = "#{padded(h)}" + ":" + "#{padded(m)}"+ ":" + "#{padded(s)}"
  end
end
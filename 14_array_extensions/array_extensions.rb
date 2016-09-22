class Array
  def sum
    self.inject(0) {|total, i| total + i}
  end

  def square
    self.map {|x| x**2}
  end

  def square!
    self.map! {|x| x**2}
  end
end
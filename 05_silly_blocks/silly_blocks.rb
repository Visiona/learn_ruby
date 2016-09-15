def reverser
  yield.split(" ").each {|word| word.reverse!}.join(" ")
end

def adder(x=1)
  yield + x
end

def repeater(x=1)
  if block_given?
    while x > 0
      x -=1
      yield
    end
  end
end
def add(x,y)
 x + y
end

def subtract(x,y)
  x - y
end

def sum(arr)
  arr.inject(0) {|total, i| total += i}
end

def multiply(arr)
  arr.inject(1) {|total, i| total *= i }
end

def power(a,b)
  iterator = 1
  1.upto(b) do |i| 
    iterator *= a 
  end
  iterator
end

def factorial(x)
  iterator = 1
  if x > 0
    1.upto(x) {|i| iterator *= i  }
  end
  iterator
end
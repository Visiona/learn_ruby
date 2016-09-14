def echo(str)
  str
end

def shout(str)
  str.upcase
end

def repeat(str, x=2)
  arr = []
  x.times {|i| arr << str }
  arr.join(" ")
end

def start_of_word(str, x)
  result=str.slice(0..x-1)
  result
end

def first_word(str)
  arr=str.split
  arr[0]
end

def titleize(str)
  new_str = str.split
  new_str = new_str.each {|word| word.capitalize! unless ((word != new_str[0]) && ("a an the and but for if nor once or so at by down for from in into like near of off on onto over past to upon with".include? word ))}.join(" ")
  new_str
end
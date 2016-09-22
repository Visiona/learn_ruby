class RPNCalculator

  def initialize
    @array = []
    @score = 0
  end

  def push(x)
    @array.push(x)
  end

  def plus
    if @array.size < 2
      raise "calculator is empty"
    else
      @score = @array[-2] + @array[-1]
      @array.pop(2)
      @array.push(@score)
    end
  end

  def minus
    if @array.size < 2
      raise "calculator is empty"
    else
      @score = @array[-2] - @array[-1]
      @array.pop(2)
      @array.push(@score)
    end
  end

  def value
    if @array.length >1
      @score
    else
      @array[0]
    end
  end

  def divide
    if @array.size < 2
      raise "calculator is empty"
    else
      @score = @array[-2].to_f / @array[-1].to_f
      @array.pop(2)
      @array.push(@score)
    end
  end

  def times
    if @array.size < 2
      raise "calculator is empty"
    else
      @score = @array[-2].to_f * @array[-1].to_f
      @array.pop(2)
      @array.push(@score)
    end
  end

  def tokens(str)
    str = str.split(" ")
    str.map do |x| 
      if "+ / - *".include? x
        x.to_sym 
      else
        x.to_i
      end
    end
  end

  def evaluate(str_equation)
    result= tokens(str_equation)
    while result.length > 1
      result.each_with_index do |x,i|
        if x == :+
          self.push(result[i-2]) # we add to sum method two numbers preceding :+ symbol
          self.push(result[i-1])
          self.plus # adding these two numbers
          result[i] = self.value # adding the sum to the beginning of the array
          result.slice!(i-2..i-1) # so we need to remove these two numbers and the symbol from the original array which is working array
          break
        elsif x == :-
          self.push(result[i-2])
          self.push(result[i-1])
          self.minus
          result[i] = self.value
          result.slice!(i-2..i-1)
          break
        elsif x == :*
          self.push(result[i-2])
          self.push(result[i-1])
          self.times
          result[i] = self.value
          result.slice!(i-2..i-1)
          break
        elsif x == :/
          self.push(result[i-2])
          self.push(result[i-1])
          self.divide
          result[i] = self.value
          result.slice!(i-2..i-1)
          break
        end
      end
    end
    result[0]
  end


end
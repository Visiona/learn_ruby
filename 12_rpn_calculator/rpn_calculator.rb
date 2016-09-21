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
    str.map {|x| "+ / - *".include? x ? x.to_sym : x.to_i}
  end


end
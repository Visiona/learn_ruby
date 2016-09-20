class Dictionary

  def initialize
    @dict = {}
  end

  def entries
    return @dict
  end

  def add(hash)
    unless hash.is_a? Hash
      @dict[hash] = nil
    else
      @dict[hash.keys[0]] = hash.values[0]
    end
  end

  def keywords
    return @dict.keys.sort
  end

  def include?(keyword)
    @dict.include? (keyword)
  end

  def find(keyword)
    @dict.select {|key, value| key==keyword || keyword == key[0..keyword.length-1] }
  end

  def printable
    printable_array = @dict.map {|key,value| %Q{[#{key}] "#{value}"}}.sort
    printable_array.map {|v| v != printable_array.last ? v + "\n" : v}.join("")
  end
end
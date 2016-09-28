class Fixnum

  def in_words(counter=0)

    numbers_words = {
      0 => "zero",
      1 => "one",
      2 => "two",
      3 => "three",
      4 => "four",
      5 => "five",
      6 => "six",
      7 => "seven",
      8 => "eight",
      9 => "nine",
      10 => "ten",
      11 => "eleven",
      12 => "twelve",
      13 => "thirteen",
      14 => "fourteen",
      15 => "fifteen",
      16 => "sixteen",
      17 => "seventeen",
      18 => "eighteen",
      19 => "nineteen",
      20 => "twenty",
      30 => "thirty",
      40 => "forty",
      50 => "fifty",
      60 => "sixty",
      70 => "seventy",
      80 => "eighty",
      90 => "ninety",
      100 => "hundred",
      1000 => "thousand",
      1_000_000 => "million",
      1_000_000_000 => "billion",
      1_000_000_000_000 => "trillion"
    }
    
    if self < 0
      puts "No results for negative numbers"
    elsif self == 0
      numbers_words[0]
    else
      no_in_progress = self.divmod(1000)
      no_in_progress = no_in_progress[1]
      phrase = ""
      if no_in_progress/100 >= 1 && no_in_progress/100 < 10 # 999/100 gives 9 so greater than one
        phrase += numbers_words[no_in_progress/100] + " " + numbers_words[100]
        phrase += " " if no_in_progress%100 > 0
        no_in_progress = no_in_progress%100 #no_in_progress now equals 99
      end
      if no_in_progress > 20 && no_in_progress < 100
        phrase += numbers_words[no_in_progress - no_in_progress%10]
        phrase += " " + numbers_words[no_in_progress%10] if no_in_progress%10 > 0 
      elsif no_in_progress <= 20 && no_in_progress > 0
        phrase += numbers_words[no_in_progress]
      end
      higher_phrase = (self / 1000).in_words(counter + 1) if self >= 1000
      suffix = numbers_words[1000**counter] if counter > 0 && phrase != ""
      puts "DBG: suffix = #{suffix.inspect}"
      "#{higher_phrase} #{phrase} #{suffix}".strip
    end
  end
end




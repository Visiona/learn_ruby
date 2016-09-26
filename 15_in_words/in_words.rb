class Fixnum

  def in_words
    @@numbers_words = {
      0 => "",
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

    def thousands(number)
      if number < 1000
        no_in_progress = number
        if no_in_progress/100 >= 1 # 999%100 gives 9 so greater than one
          no_in_words += @@numbers_words[no_in_progress/100] + " " + @@numbers_words[100]
          no_in_words += " " if no_in_progress%100 > 0
          no_in_progress = no_in_progress%100 #no_in_progress now equals 99
        end
        if no_in_progress > 20
          no_in_words += @@numbers_words[no_in_progress - no_in_progress%10]
          no_in_words += " " + @@numbers_words[no_in_progress%10] if no_in_progress%10 > 0 
        elsif no_in_progress <= 20
          no_in_words += @@numbers_words[no_in_progress]
        end
      elsif number/1_000_000_000_000 > 0
        thousands(number%1_000_000_000_000) + " trillion"
      elsif number/1_000_000_000 > 0
        thousands(number%1_000_000_000) + " billion"
      elsif number/1_000_000 > 0
        thousands(number%1_000_000) + " million"
      elsif number/1_000 > 0
        thousands(number%1_000) + " thousand"
      end
      no_in_words
    end

    if self < 0
      puts "No results for negative numbers"
    elsif self == 0
      "zero"
    else
      thousands(self)
    end
    
  end
end
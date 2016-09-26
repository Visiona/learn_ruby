class Fixnum

  def in_words
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

=begin
  
  I think if you take it three digits at a time (`x % 1000`), and in particular address the two digit numbers (`x % 100 - x % 10`) with a simple conditional (if two digit number is between 10 and 20, skip the ones place and use these predefined names) then it will be much easier to understand.

Also, are you familiar with default arguments and recursion? If you can construct a solution for 0 to 999, as above, then you should be able to divide by 1000, call the method on the next three digits, and append “thousands” or “millions” based on a counter that you increment with each recursion.  
=end
    no_in_words = ""
    no_sliced_in_words  = ""
    if self < 0
      puts "No results for negative numbers"
    elsif self == 0
      no_in_words = numbers_words[self]
    else #if the number is 999
      no_in_progress = self
      if no_in_progress/100 >= 1 # 999%100 gives 9 so greater than zero
        no_in_words += numbers_words[no_in_progress/100] + numbers_words[100] + " "
        no_in_progress = no_in_progress%100 #no_in_progress now equals 99
      end
      if no_in_progress/10 >= 1 # 99%10 gives 9 so greater than zero
        if no_in_progress > 20
          no_in_words += numbers_words[no_in_progress - no_in_progress%10] + numbers_words[no_in_progress%10]
        elsif no_in_progress >= 10 && no_in_progress <= 20
          no_in_words += numbers_words[no_in_progress]
        end
      end
    end







=begin
      remainder = self #remaining number to convert
      no_sliced = self
      numbers_words.reverse_each do |key,value| # we are finding the larges divider
        if remainder/key > 100 #if it's above 100 000 ie. 823 123
          no_in_words += numbers_words[remainder/key/100] + numbers_words[100] + " "
          no_sliced = remainder/key #823 slice
          no_sliced_in_words = value #we are storing wording of the first slice
          remainder = remainder - remainder/key/100 * key # so we have 23 123
        end
        if remainder/key > 20
            no_in_words += numbers_words[remainder/key/10] + " "
            no_sliced = remainder/key #23 slice
            no_sliced_in_words = value #we are storing wording of the first slice in case the first condition wasn't adequate
            remainder = remainder - remainder/key/10 * key #so we  have now 3 123
        end
        if remainder/key <= 20 && remainder/key > 0
          no_in_words += numbers_words[remainder/key] if remainder > 20 
          no_in_words += numbers_words[remainder] if remainder <= 20
          no_sliced = remainder/key #3 slice
          puts "DBG: no_sliced = #{no_sliced.inspect}"
          remainder = remainder - remainder/key * key
          if not (no_sliced_in_words.empty?)
            no_in_words += " " + no_sliced_in_words
            puts "DBG: no_in_words = #{no_in_words.inspect}"
          end
        end
        if remainder == 0
          break
        end
      end
    end
    no_in_words
  end
end
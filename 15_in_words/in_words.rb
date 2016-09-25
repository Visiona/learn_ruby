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
    no_in_words = ""
    no_sliced_in_words  = ""
    if self < 0
      puts "No results for negative numbers"
    elsif self == 0
      no_in_words = numbers_words[self]
    else
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


=begin
            if key > 99
              no_in_words += " " + numbers_words[key]
            end
            class_no = class_no - (class_no/key)*key
          end
        end
        if class_no/key > 20 && class_no/key < 100
          internal_no = class_no
          if internal_no > 20
            no_in_words += numbers_words[internal_no- internal_no % 10] + " "
            internal_no = internal_no % 10
          end
          if internal_no <= 20
            no_in_words += numbers_words[internal_no]
            class_no = class_no - (class_no/key)*key
          end
        end
        if class_no/key <= 20
          if class_no >= 100
            no_in_words += numbers_words[class_no/key] + " "
          end
          no_in_words += numbers_words[key]
          if class_no%key == 0
            break
          else
            class_no = class_no%key
            no_in_words += " "
          end
        end
=end



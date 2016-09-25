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
    final_number = ""
    class_no = self
    if class_no == 0
      final_number = numbers_words[class_no]
    else
      numbers_words.reverse_each do |key,value|
        if class_no/key > 1
          final_number += numbers_words[class_no/key] + " "
          puts "DBG: numbers_words[class_no/key] = #{numbers_words[class_no/key].inspect}"
          puts "DBG: class_no = #{class_no.inspect}"
          if class_no >= 100
            final_number += value
          end
          if class_no%key == 0
            break
          end
        if class_no/key > 1
          final_number += numbers_words[class_no/key] + " "
          puts "DBG: numbers_words[class_no/key] = #{numbers_words[class_no/key].inspect}"
          puts "DBG: class_no = #{class_no.inspect}"
          if class_no >= 100
            final_number += value
          end
          if class_no%key == 0
            break
          else
            class_no = class_no%key
            final_number += " "
            puts "DBG: final_number = #{final_number.inspect}"
          end
        end
        if class_no/key == 1
          if class_no >= 100
            final_number += numbers_words[class_no/key] + " "
          end
          final_number += value
          if class_no%key == 0
            break
          else
            class_no = class_no%key
            final_number += " "
          end
        end
      end
    end
    final_number
  end
end

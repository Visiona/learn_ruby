class Fixnum

  def in_words(counter=0)

    worded_numbers = {
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
      worded_numbers[0]
    else
      num_sliced = self.divmod(1000)
      num_sliced = num_sliced[1]
      hundreds_part, tens_part = num_sliced.divmod(100)
      last_digit = tens_part.divmod(10)[1]
      phrase = ""

      if (1...10).include? hundreds_part
        phrase += worded_numbers[hundreds_part] + " " + worded_numbers[100]
        phrase += " " if tens_part > 0
      end

      if (21..100).include? tens_part
        phrase += worded_numbers[tens_part - last_digit]
        phrase += " " + worded_numbers[last_digit] if last_digit > 0 
      elsif (1..20).include? tens_part
        phrase += worded_numbers[tens_part]
      end
      
      higher_phrase = (self / 1000).in_words(counter + 1) if self >= 1000
      suffix = worded_numbers[1000**counter] if counter > 0 && phrase != ""
      "#{higher_phrase} #{phrase} #{suffix}".strip
    end

  end
end
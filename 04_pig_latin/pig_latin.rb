def translate(str)
  str_arr=str.split #creating array of words
  new_word = ""
  pig_arr = []
  str_arr.each do |word| #iterating through each word in the array
    word.length.times do |i| #iterating through every letter in the word
      if (not ("a e i o u".include? word[i])) # checking if the letter is a vowel
        new_word += word[i] #sufix of future word- contains consonants only
      else
        if new_word[-1] == "q" && word[i] == "u" #exception for "qu"
          new_word += word[i] #adding u to the sufix
          i += 1 # calibrating  i
        end
        word=word[i..-1] # calibrated i allows to exclude u in qu case, it's a prefix
        break
      end
    end
    pig_arr << (word + new_word + "ay")
    new_word = ""
  end
  pig_word = pig_arr.join(" ")
  pig_word
end
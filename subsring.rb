
dictionary = ["below","down","go","going","horn","how","howdy","it","i","low","own","part","partner","sit"]



=begin
- this method creates the posible substrings when a string is given
- for ex: below can have
  b, be, bel, belo, below (until loop starts)
  e, el, elo, elow
  l, lo, low
  o, ow
  w (until loop ends because no more characters left in the string array)
- it retruns a array of sub strings within a word
- I could have used a regex with match, the take method, and other methods, however, I wanted to see if I could
- solve this problem using loops.  As you can see I still used some other string and array methods
- ASSUMPTIONS: a single split string as an array must be passed with only letters. This array already has all the
- individual letters in the string example: "below" => ['b', 'e', 'l', 'o', 'w']
- copy that array of letters, so the original doesn't get modified
- Pseudocode: run thru string array from beginning to end and build one string, two, and so until the end
- discard string that has already been build and start the process again.   Do this until the last character in the array is
- reached
- The until loop ends when the last element of the array has been added to the substrings, or when all characters have been
- iterated in the string array
- The while loop keeps track of how long the current string array is during this iteration
- Each iteration of the while loop will be the length of the whole string minus one, then it saves the newly made string by
- the for loop into the string_array
- The for loop slices the string array from zero to index + 1, and keeps saving that string, for example: if index is zero, then index + 1 = 1
- then the 'below' string will be sliced from 'be', increase index, the next iteration will slice "bel" or from 0 to 2
- (index = 1, and index + 1 = 2), and so on, the while loop is done, then destroy the first character in the string array
- and start over again
=end

def build_sub_strings(string_array)
  hold_string_array = []
  hold_string_array += string_array

  until hold_string_array.empty? do
    index = 0
    substring = ''
    while index < hold_string_array.length - 1 do
      for i in 0..index + 1 do
        substring << hold_string_array[i]
      end
      string_array.push(substring)
      substring = ''
      index += 1
    end
    hold_string_array.shift
  end

  string_array
end

=begin
  The build_sub_strings() was getting clouded, so I added this method to differentiate between a single all letter
  string, and a string that has letters and other character
  If is a single letter string simply call build_sub_strings() and return the array of possible substrings
  Else, break the string into individual strings, clean up each individual string(remove non-letter characters)
  Then call build_sub_strings() with each cleaned individual string
  After it, keep adding the strings to the string_array, finally return the string_array after the code in the else
  is done
=end
def get_sub_substrings(string)
  alphabet = ('a'..'z').to_a
  string_array = []

    if string[/[a-zA-Z]+/] == string
      string_array =  build_sub_strings(string.split(''))
    else
      string.split.each do |string|
        clean_string = string.split('').map do |element|
        next unless alphabet.include?(element.downcase)
        element.downcase
        end.compact

        string_array += build_sub_strings(clean_string)
      end
    end
  string_array
end

=begin
  I went with reduce because I'm trying to get used to this method.
  get_sub_strings() returns an array, then I traverse that array with reduce
  result is the accumulator, which in this case is a hash, the hash gets populated with new keys
  everytime it gets passed to the new iteration.  I use the dictionary array to check if the next_string
  is present.  And if it is present, then just keep adding the number that string is present, then when the
  reduce method is done iterating return the result hash.
=end

def substrings(string, dictionary)
  get_sub_substrings(string).reduce(Hash.new(0)) do |result, next_string|
    if dictionary.include?(next_string)
      result[next_string] += 1
    end
    result
  end
end


p substrings("below", dictionary) == { "below" => 1, "low" => 1 }
p substrings("Howdy partner, sit down! How's it going?", dictionary) == { "down" => 1, "go" => 1, "going" => 1, "how" => 2, "howdy" => 1, "it" => 2, "i" => 3, "own" => 1, "part" => 1, "partner" => 1, "sit" => 1 }
p substrings("How to do I go to it, and sit down, play the horn, sit, do it, then I go", dictionary) == {"how" => 1, "i" => 6, "it" => 4, "sit" => 2, "down" => 1, "horn" => 1, "go" => 2, "own" => 1 }

def concatenate_example(string)
  # use concatenation to format the result to be "Classic <string>"
  "Classic " << string
end

def concatenate(string)
  # use concatenation to format the result to be "Hello <string>!"
  "Hello " << string << "!"
end

def substrings(word)
  # return the first 4 letters from the word using substrings
  word[0, 4]
end

def capitalize(word)
  # capitalize the first letter of the word
  word.capitalize
end

def uppercase(string)
  # uppercase all letters in the string
  string.upcase
end

def downcase(string)
  string.downcase
  # downcase all letters in the string
end

def empty_string(string)
  string.empty?
  # return true if the string is empty
end

def string_length(string)
  # return the length of the string
  string.length
end

def reverse(string)
  string.reverse
  # return the same string, with all of its characters reversed
end

def space_remover(string)
  string.delete(' ')
  # remove all the spaces in the string using gsub
end

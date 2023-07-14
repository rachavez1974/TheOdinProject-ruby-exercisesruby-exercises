#This method takes in a string of characters, and shifts that string in the alphabet by the number specify in the factor
# variable passed
# It returns a new string with shifted values
# **********************************************************************************************************************

# alphabet is an array assigned all the letters in the alphabet that are uppercase and lowercase, and it's lenght is 52
# the first call to split method splits the original sentence, and uses each method to traverse through new split strings
# the call to each splits the individual string furather into chars.  This is where most of the work load happens
# A few local variables are initialize and declared to make it more readable
# 1. new_string holds the string after it's been shift by number of times specified by factor parameter
# 2. char_index holds the current char index in the alphabet array of letters
# 3. shift_factor_length is the length the char needs to be shifted
# pseudocod inside the second each
# if the char is not a letter save the character and go to next iteration
# if the shift factor is bigger than length of alphabet array, then shift from the beginning of the alphabet array
#  find the right index by subtracting the length of alphabet array from the shift_factor_length to get the right index
#  and return that char, if the original char is uppercase, check for it, and set right case
#  lastly add the new char to the new_string and continue iteratiog
#  the else simply finds the right shift when shift_factor_length is not greater than 52
#    checks for the right case and it is assigned to the new_char variable.  Again the new_char then is concatenated to
#    the new_string.
# After each string in the sentence is shifted, then it is mapped, and when all of the strings have been shifted and mapped
# to an array, then the array is join to create and return the new shifted string


def caesar_cipher(sentence, factor)
  alphabet = ('A'..'Z').to_a + ('a'..'z').to_a

    sentence.split(' ').map do |string|
     new_string = ""

      string.split('').each do |char|
        if !alphabet.include?(char)
          new_string << char
          next
        end

        char_index = alphabet.find_index(char)
        shift_factor_lenghth = char_index + factor
        new_char = ""

        if shift_factor_lenghth >= 52
          shift_factor = shift_factor_lenghth - 52
          char == char.upcase ? new_char = alphabet[shift_factor].upcase : new_char = alphabet[shift_factor].downcase
          new_string << new_char
        else
          char == char.upcase ? new_char = alphabet[char_index + factor].upcase : new_char = alphabet[char_index + factor].downcase
          new_string << new_char
        end
      end
       new_string
    end.join(' ')
end



puts caesar_cipher("What a string!", 5) == "Bmfy f xywnsl!"
puts caesar_cipher('gFrgh Fdhvdu', 3) == "jIujk Igkygx"
puts caesar_cipher('Caesar cipher: Encode and decode online', 10) == "Mkockb mszrob: Oxmyno kxn nomyno yxvsxo"
puts caesar_cipher("Get started with the #1 email marketing and automation platform today.", 8) == "Omb abizbml eqbp bpm #1 muiqt uizsmbqvo ivl icbwuibqwv xtibnwzu bwlig."
puts caesar_cipher("If he had anything confidential to say, he wrote it in cipher, that is, by so changing the order of the letters of the alphabet, that not a word could be made out.", 20) == "Cz by bux uhsnbcha wihzcxyhncuf ni mus, by qliny cn ch wcjbyl, nbun cm, vs mi wbuhacha nby ilxyl iz nby fynnylm iz nby ufjbuvyn, nbun hin u qilx wiofx vy guxy ion."

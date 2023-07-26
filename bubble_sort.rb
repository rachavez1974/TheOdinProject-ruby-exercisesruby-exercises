=begin
  - The first iterator makes sure that the array passed is traverse the exactly the length of the array - 1
    In essence if an has 4 elements, a person sorting this array would look at the array six times
    The person would take the first element and compare it to the rest of the array, moving the lesser numbrer
    to the left of the array.  Then it would do it again 3 more times
  - The inside while loop mimics a person inspecting and moving numbers around the array everytime there's a comparison
    to be made with first element.
    The while loop will break if there are no more next numbers to compare, that way it doesn't run out bounds and throws error
    get the current number, get the next number.  Use if statement to compare, if there is a match, make the switch and increase
    index.  Else move to the next iteration, but first increase index.  Reset index again before each iteration
=end



def bubble_sort(numbers)
  (numbers.size - 1).times do
    index = 0

    while index < numbers.size
      break if index == numbers.size - 1
      current_number = numbers[index]
      next_number = numbers[index + 1]

      if next_number < current_number
        numbers[index] = next_number
        index += 1
        numbers[index] = current_number
      else
        index += 1
      end
    end
  end

  numbers
end


p bubble_sort([44, 14, 98, 74, 76, 52, 78, 36, 48, 84, 30, 26, 64]) == [14, 26, 30, 36, 44, 48, 52, 64, 74, 76, 78, 84, 98]
p bubble_sort([66, 54, 22, 8, 80, 2, 28, 96, 56, 72, 4, 6, 18, 20]) == [2, 4, 6, 8, 18, 20, 22, 28, 54, 56, 66, 72, 80, 96]
p bubble_sort([90, 24, 12, 40, 58, 38, 100, 46, 10, 60, 16, 88, 92]) == [10, 12, 16, 24, 38, 40, 46, 58, 60, 88, 90, 92, 100]
p bubble_sort([50, 34, 62, 42, 68, 82, 32, 94, 86, 70]) == [32, 34, 42, 50, 62, 68, 70, 82, 86, 94]

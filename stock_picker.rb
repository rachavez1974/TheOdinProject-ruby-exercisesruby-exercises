=begin
  1. copy days array into a new array
  2. pop last element in new copy array and save it
  3. define a new empty array to hold profits and days indeces after calculations is taken place
  4. use while loop to traverse new array until the new array is empty
  5. reverse new array to start taking differences between last element popped by using the map method
     which returns an array.
     save difference, and indeces into an arary
     when the mapping is done pop again so while loop can exit out again
  6. Use max# with greater comparison operator to obtain the max profit in the array returned by the map method
  7. Use if to see if there is a profit to return a string or return the highest profit dauys
=end

days = [17,3,6,9,15,8,6,1,10]

def stock_picker(days)

  days_copy = days.dup
  last_day = days_copy.pop
  days_and_profit = []

  while !days_copy.empty? do
    days_and_profit += days_copy.reverse.map do |day|
      [[ days.find_index(day), days.find_index(last_day)], last_day - day]
    end
    last_day = days_copy.pop
  end


  max_profit = days_and_profit.max { |selling_day, buying_day| selling_day[1] <=> buying_day[1] }
  if max_profit.last <= 0
    "Donnot Buy!!!!!"
  else
    max_profit.first
  end
end

 p stock_picker(days) == [1, 4]
 p stock_picker([45, 24, 35, 31, 40, 38, 11]) == [1, 4]
 p stock_picker([9,2,4,3,8,5]) == [1, 4]
 p stock_picker([8, 1, 4, 2, 6, 5]) == [1, 4]
 p stock_picker([4, 2, 9, 7, 1, 2]) == [1, 2]
 p stock_picker([4, 2, 9, 1, 2]) == [1, 2]
 p stock_picker([1, 7, 2, 3, 6, 7, 6, 7])== [0, 1]

 p stock_picker([9,8,7,6,5]) == "Donnot Buy!!!!!"



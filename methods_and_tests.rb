puts "        RECURSION TESTS"
puts "(everything should return 'true')"
puts "---------------------------------"
# Appends n, n-1, n-2, etc. to empty array until arr[-1] == 0
def append(arr, n)
  return arr if arr[-1] == 0
  append(arr << n, n - 1)
end

# all tests such as the puts below should print "true" to console
puts "Append Method Tests:"
puts append([], 4) == [4, 3, 2, 1, 0]

# Same thing, but the resulting array goes from 0 to n
def reverse_append(arr, n)
  return arr if arr[0] == 0
  reverse_append(arr.unshift(n), n - 1)
end

puts reverse_append([], 2) == [0, 1, 2]

# Returns n!
def factorial(n)
  return 1 if n == 1 || n == 0
  n * factorial(n - 1)
end

puts "\n"
puts "Factorial Tests:"
puts factorial(3) == 6
puts factorial(0) == 1

# returns true if a string is a palindrome and false if it isn't
def palindrome(str)
  return true if str.length == 1 || str.length == 0
  return false if str[0] != str[-1]
  str = str[1..-2]
  palindrome(str)
end

puts "\n"
puts "Palindrome Tests:"
puts palindrome("racecar") == true
puts palindrome("palindrome") == false

# returns the nth fibonacci number 
# (note: this behaves like it's 0 indexed, so the 4th fib is 3, not 2)
def fib(n)
  return 0 if n == 0
  return 1 if n == 1
  fib(n - 1) + fib(n - 2)
end

puts "\n"
puts "Fibonacci Tests:"
puts fib(4) == 3
puts fib(0) == 0

# flattens an array, e.g. converts [[1, 2], [3, 4]] to 
# [1, 2, 3, 4] and [[1, [8, 9]], [3, 4]] to [1, 8, 9, 3, 4]
def flatten(arr, result = [])
  arr.each do |nested|
    if nested.is_a?(Array)
      flatten(nested, result)
    else
      result << nested
    end
  end
  
  result
end

puts "\n"
puts "Flatten Tests:"
puts flatten([[1, 2], [3, 4]]) == [1, 2, 3, 4]
puts flatten([[1, [8, 9]], [3, 4]]) == [1, 8, 9, 3, 4]

# sorts an array using recursive merge sort methodology
def merge_sort(arr, result = [])
  # base case: return array if the array has only one number
  if arr.length < 2
    return arr
  else
    # split the array in two recursively until we reach the base case
    half = arr.length / 2
    split_one = merge_sort(arr[0...half])
    split_two = merge_sort(arr[half...arr.length])
    
    # build an array sorted by comparing each array's smallest values
    while split_one.empty? == false && split_two.empty? == false
      if split_one.first > split_two.first
        result << split_two.first
        split_two.shift
      else
        result << split_one.first
        split_one.shift
      end
    end
    
    # once one of the arrays is empty, append the already sorted rest of the other array to result
    split_two.empty? ? split_one.each { |n| result << n } : split_two.each { |m| result << m }
  end
  
  # return result and move up the recursion tree until done
  result
end

puts "\n"
puts "Merge Sort Tests:"
puts merge_sort([4, 8, 6, 2, 1, 7, 5, 3]) == [1, 2, 3, 4, 5, 6, 7, 8]
puts merge_sort([1, 2, 3, 5, 4]) == [1, 2, 3, 4, 5]






































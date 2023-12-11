=begin
DAY 1: PART 1
The newly-improved calibration document consists of lines of text; 
each line originally contained a specific calibration value that 
the Elves now need to recover. On each line, the calibration value 
can be found by combining the first digit and the last digit (in that order) 
to form a single two-digit number.

For example:
1abc2
pqr3stu8vwx
a1b2c3d4e5f
treb7uchet

In this example, the calibration values of these four lines are 
12, 38, 15, and 77. Adding these together produces 142.
Consider your entire calibration document. 
What is the sum of all of the calibration values?

PEDAC PROCESS: 
#PROBLEM
- Input: File with a line of text (line = mix of characters)
- Output: Overall sum of first and last number in each line of text
- Requirements
  - Implicit: 
      1. If only one number appears > answer is both the first and last number
      2. All lines have at least 1 number
  - Explicit:

#EXAMPLES
- 1abc2 > 12
- pqr3stu8vwx > 38
- a1b2c3d4e5f > 15
- treb7uchet > 77

#DATA STRUCTURE
a1b2c3d4e5f
[1  2  3  4  5]
 1  combine  5 > 15

#ALGORITHM
1. Initialize an array with all digits > digits_list 
                 array for sums > sums_array
2. Iterate through each line > #each
    Initialize empty array > digits_in_str
    Iterate through each letter of each line > for loop
    If element is in digits_list, add element to digits_in_str
    Concatenate last and first of digits_in_str >> Convert to integer
    Add to sums_array
=end

#CODE
digits_list = %w(0 1 2 3 4 5 6 7 8 9)
sums_array = []
File.readlines('text_input_1.txt').each do |line|
 line = line.chomp
 digit_in_str = []
 for i in line.chars
  digit_in_str << i if digits_list.include?(i)
 end
 sums_array << (digit_in_str.first + digit_in_str.last).to_i
end
p sums_array.sum
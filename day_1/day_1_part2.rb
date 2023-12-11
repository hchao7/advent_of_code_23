=begin
DAY 1: PART 2
Your calculation isn't quite right. 
It looks like some of the digits are actually spelled out 
with letters: one, two, three, four, five, six, seven, eight, 
and nine also count as valid "digits".
Equipped with this new information, you now need to find 
the real first and last digit on each line. 

For example:
two1nine
eightwothree
abcone2threexyz
xtwone3four
4nineeightseven2
zoneight234
7pqrstsixteen

In this example, the calibration values are 29, 83, 13, 24, 42, 
14, and 76. Adding these together produces 281.
What is the sum of all of the calibration values?

PEDAC PROCESS: 
#PROBLEMS
- Input: File with a line of text (line = mix of characters)
- Output: Overall sum of first and last number in each line of text - 
  number could be '8' or 'eight'
- Requirements
  - Implicit: 
      1. If only one number appears > answer is both the first and last number
      2. All lines have at least 1 number
  - Explicit:

#EXAMPLES
two1nine - 29
eightwothree - 83
abcone2threexyz - 13
xtwone3four - 24
4nineeightseven2 - 42
zoneight234 - 14
7pqrstsixteen - 76

#DATA STRUCTURE
1. 
eightwothree -    83
eight two three - 83
8         3     - 83

2.
eightwo - 82 (last digit here is two, NOT eight)
0 1 2 3 4 5 6
e i g h t w o

Create index-num array = [index, num, index, num]
                         [0, '8', 4, '2']
Goal: Convert this to '8ight2wo'

3. Collect all string slices
e
  ei
  eig                                           
  eight 
i 
  ig                            
  igh...          
t                               
  tw                       
  two                 

#ALGORITHM
High-level
1. Iterate through each line > #each
2. Identify all word-nums ("eight" instead of "8") > #identify_word_nums(str)
3. Replace first and last word-num with their numerical form (from "eightwo" -> "8ight2wo")
4. Iterate through the chars of each line > for loop
5. Add all num chars into an array > digit_in_str array
6. Add sum of first and last numbers in digit_in_str array to sums_array
7. Calculate and output sum of sums_array > #sum
=end

#CODE
DIGITS_LIST = %w(0 1 2 3 4 5 6 7 8 9)
WORDS = %w(zero one two three four five six seven eight nine)
WORDS_NUMBERS_HASH = {"zero"=>'0',
                        "one"=>'1',
                        "two"=>'2',
                        "three"=>'3',
                        "four"=>'4',
                        "five"=>'5',
                        "six"=>'6',
                        "seven"=>'7',
                        "eight"=>'8',
                        "nine"=>'9' }


def identify_word_nums(str)
  index = 0
  last_index = (str.size) - 3
  index_with_num = []
  while index <= last_index
    end_index = index + 1

    while end_index <= str.size - 1
      str_slice = str[index..end_index]
      (index_with_num << index << WORDS_NUMBERS_HASH[str_slice]) if WORDS.include?(str_slice) 
      end_index += 1
    end

    index += 1
  end

  if index_with_num.size > 0
    str[index_with_num[0]] = index_with_num[1]
    str[index_with_num[-2]] = index_with_num[-1]
  end
  str
end 

sums_array = []
File.readlines('text_input_1.txt').each do |line|
  line = line.chomp
  line = identify_word_nums(line)

  digit_in_str = []
  for i in line.chars
    digit_in_str << i if DIGITS_LIST.include?(i)
  end
  sums_array << (digit_in_str.first + digit_in_str.last).to_i
end
p sums_array.sum
# frozen_string_literal: true

def even_or_odd(number)
  number.even? ? 'Even' : 'Odd'
end

def add_binary(a, b)
  (a + b).to_s(2)
end

def high_and_low(numbers)
  numbers = numbers.split.map(&:to_i)
  "#{numbers.max} #{numbers.min}"
end

def distance_between_points(a, b)
  Math.sqrt((b.y - a.y)**2 + (b.x - a.x)**2)
end

def descending_order(n)
  n.to_s.chars.sort.reverse.join.to_i
end

def compare *s
  s.map { |s| s.to_s.upcase[/^[A-Z]*$|/].sum }.reduce(&:==)
end

# đảo ngược 1 số đã sắp xếp
def descending_order(n)
  n.to_s.chars.sort.reverse.join.to_i
end

# kiểm tra có phải là in hoa
class String
  def is_upcase?
    self == upcase
  end
end

def square_or_square_root(arr)
  arr.map do |n|
    sqrt = Math.sqrt(n)
    (sqrt % 1).zero? ? sqrt : n**2
  end
end

class Ghost
  COLORS = %w[white yellow purple red].freeze
  attr_accessor :color

  def initialize
    @color = COLORS.sample
  end
end

def array_plus_array(arr1, arr2)
  (arr1 + arr2).sum
end

# Are they the "same"?
def comp(array1, array2)
  array1.nil? || array2.nil? ? false : array1.sort.map { |v| v**2 } == array2.sort
end

# give me a diamond

def diamond(n)
  return if n.even? || n < 1

  triangle = (1..n).step(2).map { |i| "#{' ' * ((n - i) / 2)}#{'*' * i}\n" }
  (triangle + triangle.reverse[1..]).join
end

# Twice linear

def dbl_linear(n)
  h = 1
  cnt = 0
  q2 = []
  q3 = []
  loop do
    return h if cnt >= n

    q2.push(2 * h + 1)
    q3.push(3 * h + 1)
    h = [q2[0], q3[0]].min
    h = q2.shift if h == q2[0]
    h = q3.shift if h == q3[0]
    cnt += 1
  end
end

# The Millionth Fibonacci Kata

def calc(num)
  if num.zero?
    [0, 1]
  elsif num == 1
    [1, 1]
  else
    a, b = calc(num / 2)
    p = a * (2 * b - a)
    q = b * b + a * a
    num.even? ? [p, q] : [q, p + q]
  end
end

def fib(num)
  return calc(num)[0] if num >= 0

  num.even? ? -calc(-num)[0] : calc(-num)[0]
end

require 'matrix'

def fib(n)
  (Matrix[[1, 1], [1, 0]]**n)[1, 0]
end

# leap year
def is_leap_year(year)
  return true if (year % 400).zero?

  (year % 4).zero? && year % 100 != 0
end

def is_leap_year(year)
  DateTime.leap? year
end

def most_frequent_item_count(collection)
  return 0 if collection == []

  collection.uniq.map { |n| collection.count(n) }.max
end

# Disemvowel Trolls
def most_frequent_item_count(collection)
  collection.uniq.map { |v| collection.count v }.max || 0
end

def disemvowel(str)
  str.delete('aeiouAEIOU')
end

def disemvowel(str)
  'ueoaiUEOAI'.each_char do |abc|
    str = str.gsub(abc, '')
  end
  str
end
p disemvowel('This website is for losers LOL!')

class String
  def toJadenCase
    str.split.map(&:capitalize).join(' ')
  end
end

# Counting duplicate
def duplicate_count(text)
  text.downcase.chars.group_by { |char| char }.count { |_char, group| group.size > 1 }
end

# Happy year
def next_happy_year(year)
  next_year = year + 1
  happy_year = false
  until happy_year
    next_year += 1
    happy_year = next_year.to_s.chars.uniq.length == 4
  end
  next_year
end

p next_happy_year(1001)

# Tower Builder
def towerBuilder(n)
  (1..n).map do |i|
    space = ' ' * (n - i)
    stars = '*' * (i * 2 - 1)
    space + stars + space
  end
end

# Highest Scoring Word

def high(x)
  word_list = x.split

  get_score = ->(word) { word.chars.map { |c| c.ord - 96 }.sum }
  score_list = word_list.map { |word| get_score.call(word) }

  highest_index = 0
  highest_score = 0
  score_list.each_with_index do |score, i|
    if score > highest_score
      highest_index = i
      highest_score = score
    end
  end
  word_list[highest_index]
end

def high(x)
  x.split.max_by { |word| word.sum(-96 * word.length) }
end

p high('man i need a taxi up to ubud')

# Sort the odd
def sort_array(source_array)
  odd = source_array.select(&:odd?).sort
  source_array.map { |x| x.odd? ? odd.shift : x }
end


#Playing with digits
def dig_pow(n, p)
  num = n.to_s
  total = (0..num.length).sum { |i| num[i].to_i**(p + i) }
  (total % n).zero? ? total / n : -1
end

p dig_pow(46288, 3)


#Find the odd int
def find_it(seq)
  seq.each do |i|
    return i if seq.count(i).odd?
  end
end
p find_it([20,1,-1,2,-2,3,3,5,5,1,2,4,20,4,-1,-2,5])


#Number-Star ladder
def pattern(n)
  output = []
  (1..n).each do |i|
    output.push("1#{'*' * (i - 1)}#{i}")
  end
  output.join('\n').sub('1', '')
end


#Sum of digital/ Digital root
def digital_root(n)
  while n > 9
    n =  n.to_s.chars.map(&:to_i).sum 
  end
  n
end

def digital_root(n)
  n < 10 ? n : digital_root(n.digital.sum)

p digital_root(942)

# Create phone numbers
def create_phone_number(numbers)
  "(#{numbers[0..2].join}) #{numbers[3..5].join}-#{numbers[6..9].join}"
end

p create_phone_number([1, 2, 3, 4, 5, 6, 7, 8, 9, 0]) # => returns "(123) 456-7890"



def count_bits(n)
  # count = 0
  # while n > 0
  #   count += n & 1
  #   n >>= 1
  # end
  # count
  n.to_s(2).count('1')
end

p count_bits(1234) #output : 5


def find_outlier(integers)
  odd, even = integers.partition(&:odd?) #
  odd.length == 1 ? odd[0] : even[0]
end

p find_outlier([2, 4, 0, 100, 4, 11, 2602, 36]) #output : 11


f order(words)
  # return '' if words.empty?

  # word = words.split
  # ordered_word = []

  # word.each do |i|
  #   ordered_word[i.match(/\d/)[0].to_i - 1] = i
  # end
  # ordered_word.join(' ')

  words.split.sort_by { |w| w[/\d/]}.join(' ')
end 


def find_even_index(arr)
  arr.each_index do |i|
    temp1 = arr[0...i].sum
    temp2 = arr[(i + 1)..].sum
    return i if temp1 == temp2
  end
  -1
end
p find_even_index([1,2,3,4,3,2,1])



def solution(str)
  result = []
  str.chars.each_slice(2) do |i|
    result << i.join
  end
  result
end

p solution('asqwe')
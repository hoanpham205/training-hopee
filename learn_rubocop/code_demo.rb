def even_or_odd(number)
  number.even? ? "Even" : "Odd"
end 

def add_binary(a,b) 
  (a+b).to_s(2) 
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
  s.map{|s| s.to_s.upcase[/^[A-Z]*$|/].sum }.reduce &:==
end

#đảo ngược 1 số đã sắp xếp 
def descending_order(n)
  n.to_s.chars.sort.reverse.join.to_i
end

#kiểm tra có phải là in hoa 
class String
  def is_upcase?
    self == upcase
  end
end

#
def square_or_square_root(arr)
  arr.map do |n|
    sqrt = Math.sqrt(n)
    sqrt % 1 == 0 ? sqrt : n**2
  end
end


class Ghost
  COLORS = %w(white yellow purple red)
  attr_accessor :color
  
  def initialize
    @color = COLORS.sample
  end
end

def array_plus_array(arr1, arr2 )
  (arr1 + arr2 ).sum 
end


# Are they the "same"?
def comp(array1, array2)
  array1.nil? || array2.nil? ? false : array1.sort.map {|v| v ** 2} == array2.sort
end

#give me a diamond

def diamond(n)
  return if n.even? || n < 1
  
  triangle = (1..n).step(2).map { |i| " " * ((n-i)/2) + "*" * i + "\n" }
  (triangle + triangle.reverse[1..-1]).join
end

#Twice linear

def dbl_linear(n)
  h = 1; cnt = 0; q2, q3 = [], []
  while true do
      if (cnt >= n) then
          return h
      end
      q2.push(2 * h + 1)
      q3.push(3 * h + 1)
      h = [q2[0], q3[0]].min
      if h == q2[0] then h = q2.shift() end
      if h == q3[0] then h = q3.shift() end
      cnt += 1
  end
end


#The Millionth Fibonacci Kata

def calc(num)
  if num == 0
    return [0, 1]
  elsif num == 1
    return [1, 1]
  else
    a, b = calc(num / 2)
    p = a * (2 * b - a)
    q = b * b + a * a
    return num % 2 == 0 ? [p, q] : [q, p + q]
  end
end

def fib(num)
  if num >= 0
    return calc(num)[0]
  else
    return num % 2 == 0 ? -calc(-num)[0] : calc(-num)[0]
  end
end

require 'matrix'

def fib(n)
  (Matrix[[1,1],[1,0]] ** n)[1,0]
end

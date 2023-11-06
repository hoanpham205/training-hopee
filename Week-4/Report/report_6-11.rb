# frozen_string_literal: true

require 'solution'
def persistence(n)
  n < 10 ? 0 : 1 + persistence(n.to_s.chars.map(&:to_i).reduce(:*))
end

def bouncingBall(h, bounce, window)
  if bounce > 0 && bounce < 1 && window < h
    count = 0
    while h > window
      count += 1
      h *= bounce
      count += 1 if h > window
    end
    return count
  else
    return -1
  end
end

def solution(str)
  str.reverse
end


def filter_list(l)
  l.select {|i| i.is_a? Integer}
end

def find_short(s)
  rs = s.split.sort_by{ |i| i.size}
  l = rs[0].size
  
  return l 
end

def get_planet_name(id)
  # This doesn't work; Fix it!
  name = ''
  case id
    when 1 
      name = "Mercury"
    when 2 
      name = "Venus"
    when 3 
      name = "Earth"
    when 4 
      name = "Mars"
    when 5 
      name = "Jupiter"
    when 6 
      name = "Saturn"
    when 7 
      name = "Uranus"  
    when 8 
      name = "Neptune"
  end
  return name
end

def sum_two_smallest_numbers(numbers)
  rs = numbers.sort
  a = rs[0] + rs[1]
end

def get_sum(a,b)
  max = [a, b].max
  min = [a, b].min
  sum = 0
  (min..max).each { |num| sum += num }
  sum
end

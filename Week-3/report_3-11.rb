# frozen_string_literal: true

def rot13(string)
  string.tr('A-Za-z', 'N-ZA-Mn-za-m')
end

def solution(string)
  string.gsub(/([A-Z])/, ' \1')
end

require 'prime'
def isPrime(num)
  num.prime?
end

def count_smileys(arr)
  arr.count { |v| v.match(/(:|;)(-|~)?(\)|D)/) }
end

def odd_or_even(array)
  array.sum.even? ? 'even' : 'odd'
end

def printer_error(s)
  "#{s.count('n-z')}/#{s.size}"
end

def longest(a1, a2)
  (a1 + a2).chars.uniq.sort.join
end

def unique_in_order(iterable)
  (iterable.is_a?(String) ? iterable.chars : iterable).chunk { |x| x }.map(&:first)
end

def to_camel_case(str)
  str.gsub(/[-_](.)/) { Regexp.last_match(1).upcase }
end

def DNA_strand(dna)
  swap = { 'A' => 'T', 'T' => 'A', 'G' => 'C', 'C' => 'G' }
  dna.chars.map { |i| swap[i] }.join
end

def is_valid_walk(walk)
  walk.count('n') == walk.count('s') && walk.count('w') == walk.count('e') && walk.size == 10
end

def array_diff(a, b)
  a.difference(b)
end

def get_count(input_str)
  input_str.count('auioe')
end

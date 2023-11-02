# frozen_string_literal: true

# trailing zeros
def zeros(n)
  n < 5 ? 0 : (n / 5) + zeros(n / 5)
end

# move zero
def move_zero(arr)
  arr.sort_by { |i| i.zero? ? 1 : 0 }
end

# p move_zero([1, 0, 2, 3, 3, 0, 7, 0, 8])

def pig_it(text)
  text.split(' ').map do |i|
    if i.match(/\W+/)
      i
    else
      "#{i[1..]}#{i[0]}ay"
    end
  end.join(' ')
end

# p pig_it 'Hello world !'

def permutations(string)
  string.chars.permutation.map(&:join).uniq
end
# p permutations('aabb')

def hamming(n)
  hamming_number = [1]
  i = 0
  j = 0
  k = 0

  while hamming_number.length < n
    next_hamming = [2 * hamming_number[i], 3 * hamming_number[j], 5 * hamming_number[k]].min
    hamming_number << next_hamming

    i += 1 if next_hamming == 2 * hamming_number[i]
    j += 1 if next_hamming == 3 * hamming_number[j]
    k += 1 if next_hamming == 5 * hamming_number[k]
  end
  hamming_number.last
end

p snail([[1, 2, 3], [4, 5, 6], [7, 8, 9]])

def rgb(r, g, b)
  [r, g, b].map do |i|
    if i <= 0
      '00'
    elsif i > 255
      'FF'
    else
      i.to_s(16).upcase
    end
  end.join
end

p rgb(173, 255, 47)

def dirReduc(arr)
  return arr if arr.nil? || arr.length <= 1

  reduction = {
    'NORTH' => 'SOUTH',
    'SOUTH' => 'NORTH',
    'EAST' => 'WEST',
    'WEST' => 'EAST'
  }

  arr.each_with_index do |dir, i|
    if reduction[dir] == arr[i + 1]
      arr[i] = nil
      arr[i + 1] = nil
    end
  end
  new_arr = arr.compact

  new_arr == arr ? arr : dirReduc(new_arr)
end

a = %w[NORTH SOUTH SOUTH EAST WEST NORTH WEST]
p dirReduc(a)

def five(op = nil)
  op.nil? ? 5 : op.call(5)
end

def six(op = nil)
  op.nil? ? 6 : op.call(6)
end

def seven(op = nil)
  op.nil? ? 7 : op.call(7)
end

def eight(op = nil)
  op.nil? ? 8 : op.call(8)
end

def nine(op = nil)
  op.nil? ? 9 : op.call(9)
end

def plus(x)
  ->(y) { y + x }
end

def minus(x)
  ->(y) { y - x }
end

def times(x)
  ->(y) { y * x }
end

def divided_by(x)
  ->(y) { y / x }
end

require 'prime'
def prime_factors(n)
  n.prime_division.map { |i, j| j == 1 ? "(#{i})" : "(#{i}**#{j})" }.join
end

def snail(array)
  # enjoy
  array.empty? ? [] : array.shift + snail(array.transpose.reverse)
end

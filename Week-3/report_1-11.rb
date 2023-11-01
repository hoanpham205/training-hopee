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

#Tong so bit
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


def order(words)
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
# frozen_string_literal: true

# def square_or_square_root(arr)
#   arr.map do |num|
#     sqrt = Math.sqrt(num).to_i
#     sqrt * sqrt == num ? sqrt : num * num
#   end
# end

# def compare(s1, s2)
#   s1.to_s.upcase.gsub(/[^A-Z]/, '')
#   s2.to_s.upcase.gsub(/[^A-Z]/, '')

#   return true if (s1.empty? && s2.empty?) || (s1 == s2) || s2.empty?

#   s1_sum = s1.sum(&:ord)
#   s2_sum = s2.sum(&:ord)

#   s1_sum == s2_sum
# end

# p compare('zzl', '')

# class Ghost
#   def color
#     colrand = rand(4)
#     case colrand
#     when 0
#       'white'
#     when 1
#       'yellow'
#     when 2
#       'purple'
#     else
#       'red'
#       end
#     end
# end

# def greet(name)
#   "Hello #{name.capitalize}"
# end

# p greet('hoan')

# def array_plus_array(arr1, arr2)
#   sum1 = arr1.sum
#   sum2 = arr2.sum

#   sum1 + sum2
# end

# p array_plus_array([1, 2, 3], [4, 5, 6])

# def square_sum(numbers)
#   sum = 0
#   numbers.each do |n|
#     sum += n**2
#   end
#   sum
# end

# p square_sum([1,2,2])

# def hero(bullets, dragons)
#     (bullets/2) >= dragons
# end

# p hero(10, 5)

# def the_middle(s)
#   if s.length.even?
#     s[s.length/2-1] + s[s.length/2]
#   else
#     s[s.length/2]
#   end
# end

# p the_middle("han")

# def positive_sum(arr)
#   arr.select { |num| num.positive? }.sum
# end

# p positive_sum([1,2,3,-4])

# def diamond(n)
#   return nil if n.even? || n.negative?

#   diamond = (1..n).step(2).map do |i|
#     ' ' * ((n - i) / 2) + '*' * i
#   end

#   (diamond + diamond[0..-2].reverse).join("\n") + "\n"
# end

#  p diamond(3)

# def is_leap_year(year)
#   return true if (year % 400).zero?

#   (year % 4).zero? && year % 100 != 0
# end

# def is_leap_year(year)
#   DateTime.leap? year
# end

# p is_leap_year(2015)

# def most_frequent_item_count(collection)
#   return 0 if collection == []

#   collection.uniq.map { |n| collection.count(n) }.max

# end
# p most_frequent_item_count([3, -1, -1])

# def build_row_text(index, character)
#   row = "|#{' |' * 9}"
#   row[index * 2 + 1] = character
#   row
# end
# p build_row_text(8, 'A')

# def disemvowel(str)
#   'ueoaiUEOAI'.each_char do |abc|
#   str = str.gsub(abc, '')
#   end
#   str
# end
# p disemvowel('This website is for losers LOL!')

# def accum(s)
#   (0...s.length).map { |i| s[i].upcase + s[i].downcase * i }.join('-')
# end

# p accum("ZpglnRxqenU")

# def is_isogram(str)
#   str.downcase.chars.uniq == str.downcase.chars
# end
# p is_isogram("Dermatoglyphics")

# str = "How can mirrors be real if our eyes aren't real";
# p str.split().map { |x| x.capitalize}.join(" ")

# def spin_words(string)
#   string.split.map { |word| word.length > 5 ? word.reverse : word}.join
# end

# p spin_words("Welcom")

# def duplicate_count(text)
#   text.downcase.chars.group_by { |char| char }.count { |_char, group| group.size > 1 }
# end

# p duplicate_count('abcdeaB')

# def next_happy_year(year)
#   next_year = year + 1
#   happy_year = false
#   until happy_year
#     next_year += 1
#     happy_year = next_year.to_s.chars.uniq.length == 4
#   end
#     next_year
# end

# p next_happy_year(1001)

# def tower_builder(n_floor)
#   tower = []
#   n_floor.times do |f|
#     star = '*'*(f*2+1)
#     space = ' '* (n_floor - f - 1)
#     floor = space + star + space
#     tower << floor
#   end
#   tower
# end

# p tower_builder(2)


# def high(x)
#   word_list = x.split

#   get_score = ->(word) { word.chars.map { |c| c.ord - 96 }.sum } # rubocop:disable Lint/Syntax
#   score_list = word_list.map { |word| get_score.call(word) }

#   highest_index = 0
#   highest_score = 0
#   score_list.each_with_index do |score, i|
#     if score > highest_score
#       highest_index = i
#       highest_score = score
#     end
#   end
#   word_list[highest_index]
# end

# p high("man i need a taxi up to ubud")

# def sort_array(source_array)
#   odd = source_array.select(&:odd?).sort
#   source_array.map { |x| x.odd? ? odd.shift : x}
# end

# p sort_array([0, 1, 2, 3, 4, 5, 6, 7, 8, 9])

# def dig_pow(n, p)
#   num = n.to_s
#   total = (0..num.length).sum { |i| num[i].to_i**(p + i) }
#   (total % n).zero? ? total / n : -1
# end

# p dig_pow(46288, 3)

# def find_nb(m)
#   total_value = 0
#   output = 1 
#   while total_value < m
#     total_value += output**3
#     output += 1
#   end

#   total_value == m ? (output - 1) : -1
# end

# p find_nb(4183059834009)

# def find_it(seq)
#   seq.each do |i|
#     return i if seq.count(i).odd?
#   end
# end
# p find_it([20,1,-1,2,-2,3,3,5,5,1,2,4,20,4,-1,-2,5])
def pattern(n)
  output = []
  (1..n).each do |i|
    output.push("1#{'*' * (i - 1)}#{i}")
  end
  output.join('\n').sub('1', '')
end


p pattern(3)
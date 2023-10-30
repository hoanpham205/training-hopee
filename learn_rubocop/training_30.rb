# frozen_string_literal: true

# def square_or_square_root(arr)
#   arr.map do |num|
#     sqrt = Math.sqrt(num).to_i
#     sqrt * sqrt == num ? sqrt : num * num
#   end
# end

# def compare(s1, s2) # rubocop:disable Naming/MethodParameterName
#   s1.to_s.upcase.gsub(/[^A-Z]/, '')
#   s2.to_s.upcase.gsub(/[^A-Z]/, '')

#   return true if (s1.empty? && s2.empty?) || (s1 == s2) || s2.empty?

#   s1_sum = s1.sum(&:ord)
#   s2_sum = s2.sum(&:ord)

#   s1_sum == s2_sum
# end

# p compare('zzl', '')

# class Ghost # rubocop:disable Style/Documentation, Style/Documentation
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
#   "Hello #{name.capitalize}" # rubocop:disable Naming/VariableName
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

def diamond(n)
  return nil if n.even? || n.negative?

  diamond = (1..n).step(2).map do |i|
    ' ' * ((n - i) / 2) + '*' * i
  end

  (diamond + diamond[0..-2].reverse).join("\n") + "\n"
end


 p diamond(3)


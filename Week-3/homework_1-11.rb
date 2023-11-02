#homework 1/11/2023
def homework(n, m)
  results = []

  while results.length < n
    numbers = (1..m).map { rand(1..100) }
    operators = ['+', '-']
    exp = numbers.zip(operators.sample(m - 1)).flatten.join(' ')
    
    result = eval(exp)
    
    if result.between?(1, 100) && !results.include?(exp)
      results << exp
    end
  end

  results
end


p homework(2,2)
p homework(2,3)

require 'test/unit'

class TestHomework < Test::Unit::TestCase
  include Test::Unit::Assertions

  def test_homework
    result1 = homework(2, 2)
    assert_equal(2, result1.size)
    result2 = homework(2, 3)
    assert_equal(2, result2.size)
    result3 = homework(5, 2)
    assert_equal(5, result3.size)
  end
end

include Test::Unit::Assertions
Test::Unit::Assertions.assert_equal(homework(0, 2), [])
Test::Unit::Assertions.assert_equal(homework(2, 0), [])
Test::Unit::Assertions.assert_equal(homework(0, 0), [])
Test::Unit::Assertions.assert_equal(homework(2, 3).size, 2)

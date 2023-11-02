#homework 1/11/2023
def homework(n, m)
  results = []

  while results.length < n
    p numbers = (1..m).map { rand(1..100) }
    operators = ['+', '-']
    exp = numbers.zip(operators.sample(m - 1)).flatten.join(' ')
    
    p result = eval(exp)
    
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
    assert_equal(3, homework(3, 3).size)
    assert_equal(0, homework(0, 2).size)
    assert_equal(0, homework(0, 3).size)
    assert_equal(1, homework(1, 2).size)
    assert_equal(1, homework(1, 3).size)
    assert_equal(2, homework(2, 2).size)
    assert_equal(3, homework(3, 2).size)
    assert_equal(3, homework(3, 3).size)
  end
end

include Test::Unit::Assertions
Test::Unit::Assertions.assert_equal(homework(0, 2), [])
Test::Unit::Assertions.assert_equal(homework(2, 0), [])
Test::Unit::Assertions.assert_equal(homework(0, 0), [])
Test::Unit::Assertions.assert_equal(homework(2, 3).size, 2)

# frozen_string_literal: true

require 'test/unit'
# rubocop:disable Style/MixinUsage
include Test::Unit::Assertions
# rubocop:enable Style/MixinUsage

staffs = [{ id: 1, positions: %w[nhanviensale truongphong] },
          { id: 2, positions: %w[tonggiamdoc nhanviensale truongphong] }]

def sort_staffs(staffs)
  positions = { 'tonggiamdoc' => 0, 'giamdoc' => 1, 'truongphong' => 2, 'nhanvienvp' => 3, 'nhanviensale' => 4 }
  staffs.sort_by do |staff|
    max_priority = staff[:positions].min_by { |pos| positions[pos] }
    staff[:positions].sort_by! { |position| positions[position] }
    [positions[max_priority], staff[:id]]
  end
end

p sort_staffs(staffs)

class TestMethod < Test::Unit::TestCase
  include Test::Unit::Assertions
  def test_array
    staffs1 = [
      { id: 1, positions: %w[nhanviensale truongphong] },
      { id: 2, positions: %w[tonggiamdoc nhanviensale truongphong] }
    ]
    expected_result1 = [
      { id: 2, positions: %w[tonggiamdoc truongphong nhanviensale] },
      { id: 1, positions: %w[truongphong nhanviensale] }
    ]
    staffs2 = []
    expected_result2 = []

    assert_equal(sort_staffs(staffs1), expected_result1)
    assert_equal(sort_staffs(staffs2), expected_result2)
  end
end

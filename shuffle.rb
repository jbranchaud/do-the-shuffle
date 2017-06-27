# Fisher-Yates Shuffle in Ruby
#
# The Fisher–Yates shuffle is an algorithm for generating a random
# permutation of a finite sequence—in plain terms, the algorithm shuffles
# the sequence. The algorithm effectively puts all the elements into a hat;
# it continually determines the next element by randomly drawing an element
# from the hat until no elements remain. The algorithm produces an unbiased
# permutation: every permutation is equally likely.
#
# https://en.wikipedia.org/wiki/Fisher%E2%80%93Yates_shuffle

# Pseudocode:
#
# -- To shuffle an array a of n elements (indices 0..n-1):
# for i from n−1 downto 1 do
#      j ← random integer such that 0 ≤ j ≤ i
#      exchange a[j] and a[i]


# Implementation

class Array
  def fisher_yates_shuffle
    upper = self.length - 1

    upper.downto(1).each do |current_index|
      random_index = rand(current_index + 1)

      temp = self[random_index]
      self[random_index] = self[current_index]
      self[current_index] = temp
    end

    self
  end
end

# Tests

require 'minitest/autorun'

class FyShuffleTest < MiniTest::Unit::TestCase
  def setup
    srand(12345)
  end

  def test_an_empty_list
    assert_equal [], [].fisher_yates_shuffle
  end

  def test_a_small_list
    assert_equal [1,2,3], [1,2,3].fisher_yates_shuffle
  end

  def test_a_large_list
    expected = [70, 34, 87, 61, 21, 50, 64, 43, 89, 36, 29, 5, 79, 14, 52, 10, 41, 66, 26, 76, 93, 46, 48, 88, 9,51, 47, 77, 40, 3, 7, 55, 72, 53, 31, 38, 58, 27, 1, 18, 85, 22, 80, 63, 19, 96, 49, 23, 59, 86, 75, 90, 33, 25, 84, 28, 17, 69, 13, 20, 92, 73, 45, 67, 68, 54, 95, 71, 91, 16, 6, 4, 65, 97, 62, 32, 56, 57, 94, 24, 44, 8, 39, 83, 82, 11, 78, 12, 74, 81, 15, 60, 98, 100, 35, 42, 37, 2, 30, 99]

    assert_equal expected, (1..100).to_a.fisher_yates_shuffle
  end
end

# restaurants = ['Umami Burger', 'Chicken and Farm', 'De Cero Tacos', 'Bad Hunter']
# puts restaurants.fisher_yates_shuffle.first

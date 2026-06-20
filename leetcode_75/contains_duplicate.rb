# Problem: Contains Duplicate
# URL: https://leetcode.com/problems/contains-duplicate/
#
# Task:
# Given an integer array, return true if any value appears at least
# twice, false if every element is distinct.

# ------------------------------------------------------------
# Approach 1: uniq comparison
# Time: O(n) | Space: O(n)
#
# Compare the length of the array after removing duplicates (uniq)
# with the original length. If they differ, a duplicate exists.
#
# Example walkthrough:
#   nums = [1, 2, 3, 1]
#   nums.uniq => [1, 2, 3]      (length 3)
#   nums.length => 4
#   3 != 4 → true (duplicate found)
#
#   nums = [1, 2, 3, 4]
#   nums.uniq => [1, 2, 3, 4]   (length 4)
#   nums.length => 4
#   4 != 4 → false (no duplicates)

# @param {Integer[]} nums
# @return {Boolean}

def contains_duplicate(nums)
  nums.uniq.length != nums.length
end

# ------------------------------------------------------------
# Approach 2: tally + frequency check
# Time: O(n) | Space: O(n)
#
# Build a frequency hash using tally, then check if any value
# appears more than once.
#
# Example walkthrough:
#   nums = [5, 7, 9, 5]
#   nums.tally => {5=>2, 7=>1, 9=>1}
#   .values => [2, 1, 1]
#   .any? { |freq| freq > 1 } => true (5 appears twice)
#
#   nums = [1, 2, 3, 4]
#   nums.tally => {1=>1, 2=>1, 3=>1, 4=>1}
#   .values => [1, 1, 1, 1]
#   .any? { |freq| freq > 1 } => false (no value repeats)

# @param {Integer[]} nums
# @return {Boolean}

def contains_duplicate(nums)
  nums.tally.values.any? { |freq| freq > 1 }
end
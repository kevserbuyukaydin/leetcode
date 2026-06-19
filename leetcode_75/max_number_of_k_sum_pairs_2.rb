# Problem: Max Number of K-Sum Pairs
# URL: https://leetcode.com/problems/max-number-of-k-sum-pairs/
# Time: O(n) | Space: O(n) — hash map storing frequency of each number.
#
# Task:
# Given an array of integers and a target k, find the maximum number of
# pairs whose sum equals k. Each number can be used once.
#
# Approach: Hash Map (frequency counting)
# 1. Build a frequency hash using tally — count_hash[x] = how many times x appears.
# 2. For each unique number x, calculate its complement: k - x.
# 3. Skip if complement doesn't exist in the hash.
# 4. Special case — x == complement (the number pairs with itself):
#    Number of pairs = freq / 2 (integer division).
#    Example: if x=3 appears 3 times and k=6, complement is also 3.
#    [3,3,3] → only 1 pair possible (3/2 = 1, floor division), one 3 left unpaired.
# 5. General case — x != complement:
#    Number of pairs = min(freq of x, freq of complement).
#    To avoid double-counting (e.g. counting both x=1→complement=4 AND x=4→complement=1
#    as separate pairs), only count when x < complement.
#
# This achieves O(n) time, faster than the two-pointer + sort approach which is O(n log n).

# @param {Integer[]} nums
# @param {Integer} k
# @return {Integer}

def max_operations(nums, k)
  count_hash = nums.tally
  operations = 0
  
  count_hash.each do |x, freq|
    complement = k - x
    next unless count_hash[complement]

    if x == complement
      operations += freq / 2
    elsif x < complement
      operations += [freq, count_hash[complement]].min
    end
  end

  operations
end
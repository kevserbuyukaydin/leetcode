# Problem: Two Sum
# URL: https://leetcode.com/problems/two-sum/
# Time: O(n) | Space: O(n) — hash map storing each number and its index.
#
# Task:
# Given an array of integers and a target, return the indices of the
# two numbers that add up to target. Exactly one valid answer exists.
#
# Approach: Hash Map (complement lookup)
# 1. Iterate through nums with index.
# 2. For each number, calculate its complement: target - num.
# 3. Check if complement already exists as a KEY in the seen hash —
#    if so, we found our pair. seen[complement] returns the INDEX
#    of that previously seen number (the value), not the complement
#    itself.
# 4. If not found, store the current number as a key with its index
#    as the value: seen[num] = idx.
# 5. Return immediately once a match is found — the problem guarantees
#    exactly one valid answer, so no need to continue the loop.
#
# Example walkthrough:
#   nums = [2,7,11,15], target = 9
#
#   idx=0, num=2, complement=7
#     seen[7] → nil (not found yet)
#     seen[2] = 0 → seen = {2=>0}
#
#   idx=1, num=7, complement=2
#     seen[2] → 0 (found! 2 was seen at index 0)
#     return [0, 1]
#
# Why hash map beats brute force:
# A brute force approach checks every pair (nested loop) — O(n^2).
# Using a hash map, each lookup is O(1) average, so checking each
# number's complement against previously seen numbers is O(n) total.

# @param {Integer[]} nums
# @param {Integer} target
# @return {Integer[]}

def two_sum(nums, target)
  seen = {}

  nums.each_with_index do |num, idx|
    complement = target - num
    if seen[complement]
      return [seen[complement], idx]
    else
      seen[num] = idx
    end
  end
end
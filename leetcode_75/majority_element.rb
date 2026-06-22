# Problem: Majority Element
# URL: https://leetcode.com/problems/majority-element/
#
# Task:
# Given an array of size n, return the majority element —
# the element that appears more than ⌊n/2⌋ times.
# It is guaranteed that the majority element always exists.

# ------------------------------------------------------------
# Approach 1: Hash Map (tally + find)
# Time: O(n) | Space: O(n) — hash stores frequency of each element.
#
# 1. Build a frequency hash using tally.
# 2. Calculate floor = n / 2.
# 3. Use find to return the first element whose frequency > floor.
#    find returns [key, value] pair, so .first gives us the element.
#
# Note: select could also be used but find is more efficient here —
# it stops at the first match, whereas select traverses the entire hash.
#
# Example:
#   nums = [3,2,3]
#   freq_hash = {3=>2, 2=>1}
#   floor = 1
#   find { freq > 1 } => [3, 2] → .first => 3

# @param {Integer[]} nums
# @return {Integer}

def majority_element(nums)
  freq_hash = nums.tally
  floor = nums.length / 2
  freq_hash.find { |num, freq| freq > floor }.first
end

# ------------------------------------------------------------
# Approach 2: Boyer-Moore Voting Algorithm
# Time: O(n) | Space: O(1) — only two variables used.
#
# This is a well-known algorithm that finds the majority element
# in linear time and constant space — no hash map needed.
#
# Key idea: Majority element always "survives" because it appears
# more than n/2 times. Other elements cancel each other out,
# but they can never fully cancel the majority element.
#
# Algorithm:
# 1. Start with count=0 and candidate=nil.
# 2. For each number:
#    - If count==0 → set current number as new candidate
#    - If current number == candidate → count += 1
#    - If current number != candidate → count -= 1
# 3. Return candidate at the end.
#
# Example:
#   nums = [2,2,1,1,1,2,2]
#   num=2 → count=0 → candidate=2, count=1
#   num=2 → candidate==num → count=2
#   num=1 → candidate!=num → count=1
#   num=1 → candidate!=num → count=0
#   num=1 → count=0 → candidate=1, count=1
#   num=2 → candidate!=num → count=0
#   num=2 → count=0 → candidate=2, count=1
#   Result: candidate=2

# @param {Integer[]} nums
# @return {Integer}

def majority_element(nums)
  count = 0
  candidate = nil

  nums.each do |num|
    candidate = num if count == 0
    candidate == num ? count += 1 : count -= 1
  end
  candidate
end
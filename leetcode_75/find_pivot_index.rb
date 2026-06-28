# Problem: Find Pivot Index
# URL: https://leetcode.com/problems/find-pivot-index/
# Time: O(n) | Space: O(1)
#
# Task:
# Find the leftmost pivot index where the sum of elements to the left
# equals the sum of elements to the right. Return -1 if none exists.
#
# Approach: Prefix Sum + Simulation
# LeetCode Analysis:
#   Current:   Prefix Sum / Simulation
#   Suggested: Prefix Sum / Simulation (matches recommended approach)
#   Key Idea:  Using total sum and running left sum to derive right sum
#              in a single pass.
#
# Algorithm:
# 1. Calculate total_sum of all elements — O(n), one pass.
# 2. Iterate through array tracking left_total:
#    right_total = total_sum - left_total - nums[idx]
#    This derives right sum in O(1) without extra traversal.
# 3. If left_total == right_total → pivot found, return idx.
# 4. Otherwise update left_total += nums[idx] and continue.
# 5. Return -1 if no pivot found.
#
# Time complexity breakdown:
#   nums.sum → O(n)
#   loop     → O(n)
#   Total    → O(2n) → O(n) (constant factors ignored in Big O)
#
# Space: O(1) — only integer variables used.
# nums.sum returns a single integer, no new array created.

# @param {Integer[]} nums
# @return {Integer}

def pivot_index(nums)
  total_sum = nums.sum
  left_total = 0

  (0...nums.length).each do |idx|
    right_total = total_sum - left_total - nums[idx]
    return idx if left_total == right_total
    left_total += nums[idx]
  end

  -1
end
# Problem: Max Number of K-Sum Pairs
# URL: https://leetcode.com/problems/max-number-of-k-sum-pairs/
# Time: O(n log n) | Space: O(n) — sort creates a new array.
#
# Note on Time Complexity:
# sort itself is O(n log n). The while loop afterward is O(n).
# O(n log n) + O(n) = O(n log n) overall, since n log n is the dominant term.
# LeetCode suggests a hash map approach can achieve O(n) instead (see _2 file).
#
# Task:
# Given an array of integers and a target k, find the maximum number of
# pairs whose sum equals k. Each number can be used once.
#
# Approach: Two Pointers (on sorted array)
# 1. Sort the array first — this allows meaningful comparison between
#    the smallest and largest remaining elements.
# 2. left starts at index 0, right starts at the last index.
# 3. If sum == k: found a pair, increment operations, move both pointers inward.
# 4. If sum < k: move left inward (need a bigger number).
# 5. If sum > k: move right inward (need a smaller number).
# 6. Repeat until left and right meet.

# @param {Integer[]} nums
# @param {Integer} k
# @return {Integer}

def max_operations(nums, k)
  sorted_nums = nums.sort
  left = 0
  right = nums.length - 1
  operations = 0

  while left < right
    if sorted_nums[left] + sorted_nums[right] == k
      operations += 1
      left += 1
      right -= 1
    elsif sorted_nums[left] + sorted_nums[right] < k
      left += 1
    elsif sorted_nums[left] + sorted_nums[right] > k
      right -= 1
    end
  end
  operations
end
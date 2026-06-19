# Problem: Maximum Average Subarray I
# URL: https://leetcode.com/problems/maximum-average-subarray-i/
# Time: O(n) | Space: O(1) — only window_sum, max_sum, and index variables used.
#
# Task:
# Find a contiguous subarray of length k with the maximum average value.
#
# Approach: Sliding Window
# 1. Calculate the sum of the first window (first k elements) — O(k), done once.
# 2. Slide the window one position at a time:
#    new_window_sum = window_sum - element_leaving + element_entering
#    This is O(1) per step — no need to re-sum the entire window each time.
# 3. Track the maximum window sum seen so far in max_sum.
# 4. Divide max_sum by k (cast to float) to get the average.
#
# Note on Time Complexity:
# Initial sum: O(k)
# Loop runs (n - k) times, each step O(1): O(n - k)
# Total: O(k) + O(n - k) = O(n)
# This is much better than the naive approach of summing each window from
# scratch, which would be O(n * k).

# @param {Integer[]} nums
# @param {Integer} k
# @return {Float}

def find_max_average(nums, k)
  lng = nums.length
  last_index = lng - k
  window_sum = nums[0..(k-1)].sum
  max_sum = window_sum

  (1..last_index).each do |idx|
    current_sum = window_sum - nums[idx-1] + nums[idx+k-1]
    max_sum = [max_sum, current_sum].max    
    window_sum = current_sum
  end
  max_sum.to_f / k
end
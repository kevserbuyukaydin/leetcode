# Problem: Longest Subarray of 1's After Deleting One Element
# URL: https://leetcode.com/problems/longest-subarray-of-1s-after-deleting-one-element/
# Time: O(n) | Space: O(1) — only left, zero_count, max_len variables used.
#
# Task:
# Delete exactly one element from a binary array.
# Return the length of the longest subarray containing only 1's.
#
# Approach: Sliding Window (variable size)
# Allow at most 1 zero in the window (the element to be deleted).
# 1. right pointer advances every iteration (each_with_index).
# 2. If num == 0 → increment zero_count.
# 3. If zero_count > 1 → window is invalid:
#    - Move left forward
#    - Decrement zero_count if left element was 0
# 4. max_len = [max_len, idx - left].max
#    idx - left instead of idx - left + 1 because we subtract
#    the deleted element (one 0 or 1 must be removed).
#
# Why if instead of while?
# while would shrink the window when zero_count > 1 — but since
# right also advances each iteration, the window never needs to
# shrink below its current size. if moves left exactly once per
# right step, keeping the window the same size or growing it.
# This guarantees O(n) time — while could be O(n²) in worst case.

def longest_subarray(nums)
  max_len = 0
  zero_count = 0
  left = 0

  nums.each_with_index do |num, idx|
    zero_count += 1 if num == 0

    if zero_count > 1
      zero_count -= 1 if nums[left] == 0
      left += 1
    end

    max_len = [max_len, idx - left].max
  end

  max_len
end
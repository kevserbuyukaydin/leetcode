# Problem: Contains Duplicate II
# URL: https://leetcode.com/problems/contains-duplicate-ii/
# 
# Task:
# Given an integer array nums and an integer k, return true if there
# exist two distinct indices i and j such that:
# - nums[i] == nums[j] (same value)
# - abs(i - j) <= k (indices are at most k apart)
# Otherwise return false.

# ------------------------------------------------------------
# Approach 1: Hash Map
# Time: O(n) | Space: O(n) — hash stores all elements.
#
# Store the last seen index of each number in a hash.
# If the same number appears again and the index difference <= k → true.
#
# Note: seen.key?(num) is used instead of seen[num] for explicit
# nil check — avoids potential issues and is more readable.

require 'set'

def contains_nearby_duplicate(nums, k)
  seen = {}
  nums.each_with_index do |num, idx|
    if seen.key?(num)
      return true if idx - seen[num] <= k
    end
    seen[num] = idx
  end
  false
end

# ------------------------------------------------------------
# Approach 2: Sliding Window + Set
# Time: O(n) | Space: O(k) — set holds at most k elements.
#
# This approach is more space efficient than Approach 1.
# Approach 1 stores ALL elements in the hash → O(n) space.
# Here, the Set acts as a sliding window of size k —
# elements outside the window are removed, so at most k
# elements are stored at any time → O(k) space.
#
# Algorithm:
# 1. If num already in set → duplicate within window → true
# 2. Add num to set
# 3. If window size exceeds k → remove oldest element (nums[idx - k])

def contains_nearby_duplicate(nums, k)
  seen = Set.new
  nums.each_with_index do |num, idx|
    return true if seen.include?(num)
    seen.add(num)
    seen.delete(nums[idx - k]) if idx >= k
  end
  false
end
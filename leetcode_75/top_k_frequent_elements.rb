# Problem: Top K Frequent Elements
# URL: https://leetcode.com/problems/top-k-frequent-elements/
# Time: O(n) | Space: O(n)
#
# Follow-up requirement: Time complexity must be better than O(n log n).
# This rules out sorting-based approaches. Bucket Sort achieves O(n).
# LeetCode confirms: "Hash Table / Array / Bucket Sort / Counting" is the
# expected approach for optimal solution.
#
# Task:
# Given an integer array and k, return the k most frequent elements.
#
# Approach: Bucket Sort by Frequency
# 1. Count frequency of each number using tally — O(n).
# 2. Create buckets array of size (nums.length + 1), where buckets[i]
#    holds all numbers that appear exactly i times.
#    Index = frequency, value = array of numbers with that frequency.
# 3. Traverse buckets from highest index (highest frequency) to lowest,
#    collecting numbers until we have k elements.
#
# Example walkthrough:
#   nums = [1, 1, 1, 2, 2, 3], k = 2
#
#   Step 1: freq_hash = nums.tally
#     => {1=>3, 2=>2, 3=>1}
#     
#   Why bucket size is (nums.length + 1):
#   A number can appear at most nums.length times (if all elements are the same).
#   Frequencies range from 1 to nums.length, but Ruby arrays are 0-indexed,
#   so we need indices 0 through nums.length to safely reach the highest
#   possible frequency. buckets[0] is never used (frequency can't be 0),
#   but we still need n+1 total slots to have an index n available.
#
#   Step 2: buckets = Array.new(7) { [] }
#     => [[], [], [], [], [], [], []]
#  index: 0   1   2   3   4   5   6
#
#     After filling buckets based on freq_hash:
#     buckets[3] << 1   (1 appears 3 times)
#     buckets[2] << 2   (2 appears 2 times)
#     buckets[1] << 3   (3 appears 1 time)
#     => [[], [3], [2], [1], [], [], []]
#  index: 0   1    2    3   4   5   6
#
#   Step 3: Traverse from index 6 down to 0, collecting elements:
#     idx=6 → [] → skip
#     idx=5 → [] → skip
#     idx=4 → [] → skip
#     idx=3 → [1] → result = [1]
#     idx=2 → [2] → result = [1, 2] → length == k=2 → return [1, 2]
#
# Why no sorting needed: frequency is used directly as the array index,
# so traversing from the highest index to the lowest naturally visits
# elements in descending order of frequency — no comparison/sort required.

def top_k_frequent(nums, k)
  freq_hash = nums.tally
  buckets = Array.new(nums.length + 1) { [] }

  freq_hash.each do |num, freq|
    buckets[freq] << num
  end

  result = []
  (buckets.length - 1).downto(0) do |idx|
    buckets[idx].each do |num|
      result << num
      return result if result.length == k
    end
  end
end
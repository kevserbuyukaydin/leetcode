# Problem: Find the Difference of Two Arrays
# URL: https://leetcode.com/problems/find-the-difference-of-two-arrays/
#
# Task:
# Given two arrays, return a list of size 2 where:
# answer[0] = distinct integers in nums1 not present in nums2
# answer[1] = distinct integers in nums2 not present in nums1

# ------------------------------------------------------------
# Approach 1: uniq + Array subtraction
# Time: O(n+m) | Space: O(n+m)
#
# Ruby's array `-` operator internally uses a hash for lookups,
# so this is efficient — not a naive O(n*m) nested comparison.
#
# Note: nums1.uniq and nums2.uniq are each computed once and stored
# in variables (u1, u2) to avoid calling .uniq twice on the same
# array. While this doesn't change the Big O complexity (constant
# factors are dropped), it avoids redundant work in practice.

# @param {Integer[]} nums1
# @param {Integer[]} nums2
# @return {Integer[][]}

def find_difference(nums1, nums2)
  u1 = nums1.uniq
  u2 = nums2.uniq
  [(u1 - u2), (u2 - u1)]
end

# ------------------------------------------------------------
# Approach 2: Set
# Time: O(n+m) | Space: O(n+m)
#
# Note: Set internally uses a Hash structure for storage.
# Set.new([2, 3, 4])
# => #<Set: {2, 3, 4}>
# Internally, this behaves similarly to: {2=>true, 3=>true, 4=>true}
# Each element becomes a hash key — values are irrelevant, only
# key existence matters. This is why Set#include? and Set#- are
# fast (O(1) average lookups), same as Hash.

# @param {Integer[]} nums1
# @param {Integer[]} nums2
# @return {Integer[][]}

require 'set'

def find_difference(nums1, nums2)
  set1 = nums1.to_set
  set2 = nums2.to_set
  [(set1 - set2).to_a, (set2 - set1).to_a]
end

# ------------------------------------------------------------
# Approach 3: Hash map + reject
# Time: O(n+m) | Space: O(n+m)
#
# Build a hash for each array (O(1) lookup), then reject elements
# that exist in the other array's hash.
#
# Example walkthrough:
#   nums1 = [1,2,3,3], nums2 = [1,1,2,2]
#   hash1 = {1=>true, 2=>true, 3=>true}
#   hash2 = {1=>true, 2=>true}
#   diff1 = nums1.uniq.reject { |el| hash2[el] } => [3]
#     (1 and 2 are rejected because hash2[1] and hash2[2] are truthy)
#   diff2 = nums2.uniq.reject { |el| hash1[el] } => []
#     (1 and 2 are rejected because hash1[1] and hash1[2] are truthy)

# @param {Integer[]} nums1
# @param {Integer[]} nums2
# @return {Integer[][]}

def find_difference(nums1, nums2)
  hash1 = nums1.uniq.each_with_object({}) { |el, hash| hash[el] = true }
  hash2 = nums2.uniq.each_with_object({}) { |el, hash| hash[el] = true }
  
  diff1 = nums1.uniq.reject { |el| hash2[el] }
  diff2 = nums2.uniq.reject { |el| hash1[el] }
  
  [diff1, diff2]
end

# ------------------------------------------------------------
# Note: All three approaches share the same O(n+m) time and space
# complexity, since each relies on hash-based lookups under the hood
# (Array#-, Set#-, and Hash#[] all average O(1) per lookup).
# The choice between them is mainly about readability and style,
# not performance.

# Each approach's complexity breakdown, line by line:
#
# Approach 1 (uniq + subtraction):
#   u1 = nums1.uniq          → O(n) time, O(n) space
#   u2 = nums2.uniq          → O(m) time, O(m) space
#   u1 - u2, u2 - u1         → O(n+m) time, O(n+m) space (new arrays)
#
# Approach 2 (Set):
#   nums1.to_set              → O(n) time, O(n) space
#   nums2.to_set               → O(m) time, O(m) space
#   set1 - set2, set2 - set1   → O(n+m) time, O(n+m) space (new Sets)
#   .to_a calls                → O(n+m) time, O(n+m) space (new Arrays)
#
# Approach 3 (Hash + reject):
#   hash1, hash2 building      → O(n+m) time, O(n+m) space
#   reject calls                → O(n+m) time, O(n+m) space (new arrays)
#
# Final [diff1, diff2] wrapping → O(1) time, O(1) space
#   (just holds 2 references, doesn't copy the underlying arrays)
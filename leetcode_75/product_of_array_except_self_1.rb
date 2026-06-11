# Problem: Product of Array Except Self
# URL: https://leetcode.com/problems/product-of-array-except-self/
# Time: O(n) | Space: O(n) — prefix and suffix arrays each hold n elements.
#
# Task:
# Given an integer array nums, return an array where each element
# is the product of all elements except itself. No division allowed.
#
# Approach:
# 1. First pass (left to right): Store prefix products in prefix array.
#    prefix[i] = product of all elements to the left of i
# 2. Second pass (right to left): Store suffix products in suffix array.
#    suffix[i] = product of all elements to the right of i
# 3. Result: prefix[i] * suffix[i] for each i

# @param {Integer[]} nums
# @return {Integer[]}

def product_except_self(nums)
    prefix = []
    suffix = []

    (0...nums.length).each do |idx|
      next prefix[idx] = 1 if idx == 0
      prefix[idx] = prefix[idx-1] * nums[idx-1]
    end

    (nums.length - 1).downto(0) do |idx|
      next suffix[idx] = 1 if idx == nums.length - 1
      suffix[idx] = suffix[idx+1] * nums[idx+1]
    end

    return prefix.map.with_index { |val, idx| val * suffix[idx]}
end
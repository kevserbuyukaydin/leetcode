# Problem: Product of Array Except Self
# URL: https://leetcode.com/problems/product-of-array-except-self/
# Time: O(n) | Space: O(1) — only a single suffix variable is used as extra space.
#                            The result array is not counted as it is the required output.
#
# Task:
# Given an integer array nums, return an array where each element
# is the product of all elements except itself. No division allowed.
#
# Approach:
# 1. First pass (left to right): Store prefix products in result array.
#    result[i] = product of all elements to the left of i
# 2. Second pass (right to left): Multiply each result[i] with running suffix.
#    suffix holds the product of all elements to the right of i

# @param {Integer[]} nums
# @return {Integer[]}

def product_except_self(nums)
    result = []

    (0...nums.length).each do |idx|
      next result[idx] = 1 if idx == 0
      result[idx] = result[idx-1] * nums[idx-1]
    end

    suffix = 1
    (nums.length - 1).downto(0) do |idx|
      result[idx] *= suffix
      suffix *= nums[idx]
    end

    result
end





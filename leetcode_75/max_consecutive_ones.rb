# Problem: Max Consecutive Ones
# URL: https://leetcode.com/problems/max-consecutive-ones/
# Time: O(n) | Space: O(1) — only current_count and max_count variables used.
#
# Task:
# Given a binary array, find the maximum number of consecutive 1s.
#
# Approach: Single Pass Counter
# 1. Iterate through the array, tracking current_count of consecutive 1s.
# 2. When a 0 is encountered, compare current_count with max_count,
#    update max_count if needed, then reset current_count to 0.
# 3. After the loop ends, do a final comparison — this handles the case
#    where the array ends with a streak of 1s (the else branch never
#    triggers to capture the last group).

# @param {Integer[]} nums
# @return {Integer}

def find_max_consecutive_ones(nums)
  current_count = 0
  max_count = 0

  nums.each do |num|
    if num == 1
      current_count += 1
    else
      max_count = current_count if current_count > max_count
      current_count = 0
    end
  end

  max_count = [max_count, current_count].max
  max_count
end
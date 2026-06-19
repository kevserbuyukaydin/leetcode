# Problem: Container With Most Water
# URL: https://leetcode.com/problems/container-with-most-water/
# Time: O(n) | Space: O(1) — only left, right, and max_area variables used.
#
# Task:
# Given an array of heights representing vertical lines, find two lines
# that together with the x-axis form a container holding the most water.
# Area = (right - left) * min(height[left], height[right])
#
# Approach: Two Pointers
# 1. left starts at index 0, right starts at the last index.
# 2. At each step, calculate the area and update max_area if it's larger.
# 3. Move the pointer with the SHORTER height inward.
#    Why? The area is limited by the shorter line. Moving the taller line
#    inward only decreases width while height stays capped at the shorter one —
#    guaranteed to shrink the area. Moving the shorter line gives a chance
#    to find a taller line and potentially increase the area.
# 4. Repeat until left and right meet.


def max_area(height)
  left = 0
  right = height.length - 1

  max_area = 0
  while left < right
    previous_max_area = (right - left) * [height[right], height[left]].min
    max_area = [max_area, previous_max_area].max

    if height[left] < height[right]
      left += 1
    else
      right -= 1
    end
  end
  max_area
end
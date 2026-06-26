# Problem: Find the Highest Altitude
# URL: https://leetcode.com/problems/find-the-highest-altitude/
# Time: O(n) | Space: O(1) — only two variables used.
#
# Task:
# A biker starts at altitude 0. Given an array of altitude gains,
# find the highest altitude reached during the trip.
#
# Approach: Prefix Sum
# Track cumulative altitude as we iterate through gain values.
# At each step: current_altitude += gain → new altitude
# Keep track of the maximum altitude seen so far.
#
# Why [max, current].max instead of ternary?
# Ruby's built-in .max is implemented in C — faster than manual
# comparison + assignment with ternary operator.
#
# Example:
#   gain = [-5, 1, 5, 0, -7], starting altitude = 0
#   -5 → current = -5, max = 0
#   1  → current = -4, max = 0
#   5  → current = 1,  max = 1
#   0  → current = 1,  max = 1
#   -7 → current = -6, max = 1
#   Result: 1 

def largest_altitude(gain)
  current_altitude = 0
  max_altitude = 0

  gain.each do |altitude_gain|
    current_altitude += altitude_gain
    max_altitude = [max_altitude, current_altitude].max
  end

  max_altitude
end
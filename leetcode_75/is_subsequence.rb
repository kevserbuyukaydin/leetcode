# Problem: Is Subsequence
# URL: https://leetcode.com/problems/is-subsequence/
# Time: O(n) | Space: O(1) — only one integer pointer used as extra space.
#
# Task:
# Given two strings s and t, return true if s is a subsequence of t.
# A subsequence preserves relative order but characters don't need to be adjacent.
#
# Approach: Two Pointers (single pass through t)
# 1. s_idx tracks the next character we need to match in s.
# 2. Iterate through t — when t's current character matches s[s_idx], advance s_idx.
# 3. After the loop, if s_idx equals s.length, all characters of s were found in order.
#
# Note: No special handling needed for empty strings —
# if s is empty, s_idx (0) equals s.length (0) immediately after the loop.
# if t is empty, the loop simply doesn't run, and s_idx stays less than s.length (unless s is also empty).

## @param {String} s
# @param {String} t
# @return {Boolean}

def is_subsequence(s, t)
  s_idx = 0
  
  t.each_char do |chr|
    s_idx += 1 if s[s_idx] == chr
  end
  s_idx == s.length
end
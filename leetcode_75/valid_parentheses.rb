# Problem: Valid Parentheses
# URL: https://leetcode.com/problems/valid-parentheses/
# Time: O(n) | Space: O(n) — stack can hold up to n elements in worst case
#                            (e.g. all characters are opening brackets).
#
# Task:
# Given a string of brackets, determine if it is valid.
# Valid means: every opening bracket has a matching closing bracket
# of the same type, in the correct order.
#
# Approach: Stack
# 1. Iterate through each character.
# 2. Opening bracket → push onto stack.
# 3. Closing bracket → pop from stack and check if it matches.
#    If not → return false immediately.
# 4. After the loop → stack must be empty (no unmatched opening brackets).
#
# Why Stack?
# Stack's LIFO (Last In, First Out) nature perfectly handles nested
# brackets — the most recently opened bracket must be closed first.
#
# Example walkthrough:
#   s = "([)]"
#   '(' → stack = ["("]
#   '[' → stack = ["(", "["]
#   ')' → pop "[", pairs[")"] = "(" ≠ "[" → return false
#
#   s = "([])"
#   '(' → stack = ["("]
#   '[' → stack = ["(", "["]
#   ']' → pop "[", pairs["]"] = "[" == "[" → continue
#   ')' → pop "(", pairs[")"] = "(" == "(" → continue
#   stack.empty? → true 

# @param {String} s
# @return {Boolean}

def is_valid(s)
  stack = []
  open_brackets = ["(", "[", "{"]
  pairs = { ")" => "(", "]" => "[", "}" => "{" }

  s.each_char do |chr|
    if open_brackets.include?(chr)
      stack << chr
    else
      return false unless pairs[chr] == stack.pop
    end
  end
  stack.empty?
end
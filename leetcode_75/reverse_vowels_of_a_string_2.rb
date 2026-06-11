# Problem: Reverse Vowels of a String
# URL: https://leetcode.com/problems/reverse-vowels-of-a-string/
# Time: O(n) | Space: O(1) — only two integer pointers used as extra space.
#
# Task:
# Given a string s, reverse only the vowels and return it.
# Both uppercase and lowercase vowels are considered.
#
# Approach: Two Pointers with helper method
# 1. left pointer starts from the beginning, right pointer from the end.
# 2. If left is a vowel and right is a vowel → swap, move both pointers inward.
# 3. If left is a vowel but right is not → move right backward.
# 4. If left is not a vowel → move left forward.
# 5. Repeat until pointers meet.

# @param {String} s
# @return {String}
def reverse_vowels(s)
  left = 0
  right = s.length - 1

  while left < right
    if check_vowels(s, left)
      if check_vowels(s, right)
        s[left], s[right] = s[right], s[left]
        left += 1
        right -= 1
      else
        right -= 1
      end
    else
      left += 1
    end
  end
  s
end

def check_vowels(s, idx)
  "aeiouAEIOU".include?(s[idx])
end

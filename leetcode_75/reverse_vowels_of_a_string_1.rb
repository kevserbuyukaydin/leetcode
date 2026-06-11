# Problem: Reverse Vowels of a String
# URL: https://leetcode.com/problems/reverse-vowels-of-a-string/
# Time: O(n) | Space: O(1) — modifying the string in place, no extra space used.
#
# Task:
# Given a string s, reverse only the vowels and return it.
# Both uppercase and lowercase vowels are considered.
#
# Approach: Two Pointers
# 1. left pointer starts from the beginning, right pointer from the end.
# 2. Move left forward until a vowel is found.
# 3. Move right backward until a vowel is found.
# 4. Swap the two vowels, move both pointers inward.
# 5. Repeat until pointers meet.

# @param {String} s
# @return {String}
def reverse_vowels(s)
  left = 0
  right = s.length - 1

  while left < right
    left += 1 until left >= right || "aeiouAEIOU".include?(s[left])
    right -= 1 until left >= right || "aeiouAEIOU".include?(s[right])

    s[left],s[right] = s[right],s[left]
    left = left + 1
    right = right - 1
  end
  s
end

# Problem: Maximum Number of Vowels in a Substring of Given Length
# URL: https://leetcode.com/problems/maximum-number-of-vowels-in-a-substring-of-given-length/
# Time: O(n) | Space: O(k)
#
# Task:
# Given a string s and an integer k, return the maximum number of
# vowel letters in any substring of s with length k.
# Vowels: 'a', 'e', 'i', 'o', 'u'
#
# Approach: Fixed-size Sliding Window
# 1. Calculate vowel count for the first window (first k characters) — O(k).
# 2. Slide the window one character at a time:
#    - outgoing_character (s[idx - k]) leaves the window → decrement if vowel
#    - incoming_character (s[idx]) enters the window → increment if vowel
#    Each slide is O(1) — no need to recount the entire window.
# 3. Track maximum vowel count seen so far.
#
# Why Sliding Window?
# Brute force recounts k characters for every window → O(n×k)
# Sliding Window updates only the changed characters → O(n)
# Example: n=100000, k=50000
#   Brute force → 5 billion operations
#   Sliding Window → 100,000 operations
#
# Why "aeiou".include? instead of regex?
# Regex compiles the pattern each call → slower.
# String include? uses C implementation → O(1), fastest option.
#
# Space Complexity: O(k)
# current_substring holds k characters → O(k)
# All other variables are integers → O(1)

# @param {String} s
# @param {Integer} k
# @return {Integer}

def max_vowels(s, k)
  current_substring = s[0, k]
  vowel_count = current_substring.count("aeiou")
  max_vowel_count = vowel_count

  (k...s.length).each do |idx|
    outgoing_character = s[idx - k]
    incoming_character = s[idx]

    vowel_count -= 1 if "aeiou".include?(outgoing_character)
    vowel_count += 1 if "aeiou".include?(incoming_character)

    max_vowel_count = [max_vowel_count, vowel_count].max
  end
  max_vowel_count
end
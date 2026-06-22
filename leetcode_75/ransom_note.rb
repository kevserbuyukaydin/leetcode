# Problem: Ransom Note
# URL: https://leetcode.com/problems/ransom-note/
#
# Task:
# Given two strings ransomNote and magazine, return true if ransomNote
# can be constructed using letters from magazine. Each letter in magazine
# can only be used once.

# ------------------------------------------------------------
# Approach 1: tally + manual check
# Time: O(n+m) | Space: O(n)
#
# Space breakdown:
# - magazine.chars creates an intermediate array of size n → O(n)
# - .tally then builds a hash from this array → O(k), k ≤ 26
# - The intermediate chars array is the dominant space cost → O(n) total
#
# Note: count && count > 0 check is needed here because tally returns
# a regular hash — missing keys return nil, and nil > 0 raises NoMethodError.
#
# Example:
#   magazine = "aab" → freq_hash = {"a"=>2, "b"=>1}
#   ransomNote = "aa"
#   'a' → count=2 > 0 → decrement → freq_hash["a"]=1
#   'a' → count=1 > 0 → decrement → freq_hash["a"]=0
#   Loop ends → return true

# @param {String} ransom_note
# @param {String} magazine
# @return {Boolean}

def can_construct(ransom_note, magazine)
  freq_hash = magazine.chars.tally

  ransom_note.each_char do |chr|
    count = freq_hash[chr]
    if count && count > 0
      freq_hash[chr] -= 1
    else
      return false
    end
  end
  true
end

# ------------------------------------------------------------
# Approach 2: Hash.new(0) + each_char
# Time: O(n+m) | Space: O(1)
#
# Space breakdown:
# - No intermediate array created (each_char iterates directly over string)
# - Hash.new(0) holds at most 26 keys (only lowercase English letters)
# - Hash size is bounded by the alphabet size, not input size → O(1)
#
# Key improvements over Approach 1:
# 1. Hash.new(0) — missing keys return 0 instead of nil,
#    so no nil check needed (nil > 0 would raise NoMethodError).
# 2. each_char instead of chars.tally — no intermediate array created,
#    saving O(n) memory.
# 3. Since only 26 possible keys exist, hash size is bounded → O(1) space.

# @param {String} ransom_note
# @param {String} magazine
# @return {Boolean}

def can_construct(ransom_note, magazine)
  freq_hash = Hash.new(0)
  magazine.each_char { |chr| freq_hash[chr] += 1 }

  ransom_note.each_char do |chr|
    if freq_hash[chr] > 0
      freq_hash[chr] -= 1
    else
      return false
    end
  end
  true
end
# Problem: Unique Number of Occurrences
# URL: https://leetcode.com/problems/unique-number-of-occurrences/
# Time: O(n) | Space: O(k) — k = number of distinct elements in arr (k <= n).
#                            In the worst case (all elements unique), k = n, so O(n).
#
# Task:
# Given an array of integers, determine if the number of occurrences
# of each value is unique (no two values share the same frequency).
#
# Approach: Hash Map (frequency counting) + uniqueness check
# 1. arr.tally — O(n), builds a hash counting occurrences of each value.
# 2. .values — O(k), extracts just the frequency counts into an array.
# 3. .uniq — O(k), removes duplicate frequencies.
# 4. Compare lengths: if uniq array's length equals original values array's
#    length, no frequency was duplicated — all occurrences are unique.
#
# Overall: O(n) + O(k) + O(k) — since k <= n, the dominant term is n,
# giving total time complexity O(n).

# @param {Integer[]} arr
# @return {Boolean}

def unique_occurrences(arr)
    freq_values = arr.tally.values
    return true if freq_values.uniq.length == freq_values.length
    false
end
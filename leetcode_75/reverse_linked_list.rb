# Problem: Reverse Linked List
# URL: https://leetcode.com/problems/reverse-linked-list/
# Time: O(n) | Space: O(1) — only three pointer variables used.
#
# Task:
# Given the head of a singly linked list, reverse the list and return it.
#
# Key concept: Linked List
# Unlike arrays, linked list nodes can only be traversed forward via .next
# Random access (like array[i]) is not possible.
# head → first node, each node has val and next pointing to the next node.
#
# Approach: Iterative (Three Pointers)
# At each step, reverse the next pointer of the current node.
# Three variables are needed:
#   prev     → previous node (starts as nil — nothing before first node)
#   current  → current node being processed
#   next_node → saves the next node before we overwrite current.next
#
# Each iteration:
#   1. next_node = current.next   → save next before losing it
#   2. current.next = prev        → reverse the pointer
#   3. prev = current             → advance prev
#   4. current = next_node        → advance current
#
# When loop ends, current = nil and prev = last node (new head).
#
# Example: 1 → 2 → 3 → nil
#   Step 1: nil ← 1    2 → 3 → nil   (prev=1, current=2)
#   Step 2: nil ← 1 ← 2    3 → nil   (prev=2, current=3)
#   Step 3: nil ← 1 ← 2 ← 3          (prev=3, current=nil)
#   Return prev (3) → new head
#
# Edge case: empty list (head = nil)
#   current = nil → loop never runs → prev = nil → returns nil ✅

# Definition for singly-linked list.
# class ListNode
#     attr_accessor :val, :next
#     def initialize(val = 0, _next = nil)
#         @val = val
#         @next = _next
#     end
# end
# @param {ListNode} head
# @return {ListNode}
def reverse_list(head)
  current = head
  prev = nil

  while current
    next_node = current.next
    current.next = prev
    prev = current
    current = next_node
  end
  prev
end
# Example 1: str1 = "ABABAB", str2 = "ABAB" => "AB"
# Example 2: str1 = "ABCABC", str2 = "ABC" => "ABC"
# Example 3: str1 = "LEET", str2 = "CODE" => ""
# Example 4: str1 = "AAAAAB", str2 = "AAA" => ""

def gcd_of_strings(str1, str2)
    return "" if str1 + str2 != str2 + str1
    
    len = gcd_length(str1.length, str2.length)
    return str1[0...len]
end

def gcd_length(str1_len, str2_len)
    min_len, max_len = [str1_len, str2_len].minmax
    rem = max_len % min_len
    return min_len if rem == 0
    gcd_length(min_len, rem)
end

puts gcd_of_strings("ABABAB", "ABAB")
puts gcd_of_strings("ABCABC", "ABC")
puts gcd_of_strings("LEET", "CODE")
puts gcd_of_strings("AAAAAB", "AAA")
def greatest_common_divisor(p1, p2)
  return p2 if p1 == p2
  min, max= [p1, p2].sort
  surplus = max % min
  return min if surplus == 0
  greatest_common_divisor(min, surplus)
end

puts greatest_common_divisor(30, 20)
puts greatest_common_divisor(1763,1927)
puts greatest_common_divisor(152963, 783049)
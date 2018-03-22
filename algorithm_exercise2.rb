def return_string_length(argument, count = 0)
  for num in argument.split("")
    count += 1
  end
  return count
end

puts return_string_length("aaaaaaa")
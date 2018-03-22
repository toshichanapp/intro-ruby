def replace_down_to_upper(str, tmp_arr=[])
  chars = str.split("")
  chars.each do |char|
    char = char.match(/[a-z]/) ? char.upcase : char.downcase
    tmp_arr << char
  end
  return tmp_arr.join
end


puts replace_down_to_upper('abCD')
puts replace_down_to_upper('EEEE')
puts replace_down_to_upper('abaa')
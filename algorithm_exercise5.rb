num = 40

1.upto(num) do |i|
  is_contain3 = i.to_s.include?("3")
  is_mutiple3 = i % 3 == 0

  if (is_contain3 || is_mutiple3)
    puts "hoge"
    puts
  else
    puts i
    puts
  end

end
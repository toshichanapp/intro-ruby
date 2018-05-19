list = 1..100
target = 42

for n in list do
  puts "#{n}かいめ"
  if n == target
    puts "targetを見つけました"
    break
  end
end
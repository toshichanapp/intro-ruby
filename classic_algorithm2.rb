def binary_search(numbers,value)
  list = numbers.sort
  half_length = list.length / 2

end

numbers = [1,3,5,11,12,13,17,22,25,28]
p(numbers)

puts('探したい数字を入力してください')
target_number = gets.to_i

message = binary_search(numbers,target_number)

puts(message)

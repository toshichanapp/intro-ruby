def linear_search(numbers,value)
  list = numbers.sort
  index = list.index(value)
  return index.nil? ? "none" : index
end

numbers = [1,3,5,11,12,13,17,22,25,28]
p(numbers)

puts('探したい数字を入力してください')
target_number = gets.to_i

message = linear_search(numbers,target_number)

puts(message)
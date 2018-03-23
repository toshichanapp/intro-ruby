def judge(pc, user)
  score = (pc - user + 3) % 3
  case score
  when 1
    puts "あなたの負けです"
  when 2
    puts "あなたの勝ちです"
  when 0
    puts "あいこです．もう一度"
    start
  end
end


def start
  hand = {1=>"グー", 2=>"パー", 3=>"チョキ"}
  puts '数字を入力してください。'
  hand.each do |key, value|
    puts "#{key}: #{value}"
  end

  pc = rand(1..3)
  user = gets.to_i
  if 0 < user && user <= 3
    judge(pc, user)
  else
    puts "１〜３を入力してください"
    puts
    puts "------------------------"
    start
  end
  #puts "pc#{hand[pc]} user#{hand[user]}"

end


start
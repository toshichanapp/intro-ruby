list = (1..100).to_a  #探索対象
target_number = 42 # 探索目標

low_index = 0 # スタートindex
high_index = list.length - 1 # ゴールindex
puts "スタート"
puts "indexのlow_index#{low_index} high_indexは#{high_index}"
n = 0
puts "----------------------------------------"


while low_index <= high_index do
# while low_index != high_index do
# 探索範囲のスタート地点とゴール地点が同じ（ターゲットが見つかった）であれば終わる

  n += 1
  # 基準のindexを決める
  center_index = ((low_index + high_index) / 2).floor

  puts "#{n}回目現在の基準indexは #{center_index} 値は #{list[center_index]}"

  if list[center_index] < target_number
    low_index = center_index + 1
    puts "基準値はtargetよりも小さいです"
  elsif list[center_index] > target_number
    high_index = center_index - 1
    puts "基準値はtargetよりも大きいです"
  else
    # while != だと見つけるまで続けるループなので，見つかってもここは実行されない
    puts "targetを見つけました"
    break
  end
  puts "次の探索範囲のindexは #{low_index} から #{high_index}"
  puts "----------------------------------------"
end

# 野呂さんの問い
# whileってどこで抜けるの？
# 2文探索を使う時ってindexで調べていいの？ valueで調べた方がいいんじゃないの？
# そもそも2文探索の対象はソートされていることが前提
# -> 真ん中の要素 の判定はindexで判断する
# 条件分岐は要素の値でおこなう

require 'rubycards'
include RubyCards

# Handインスタンスの生成
hand = Hand.new

# Deckインスタンスの生成
deck = Deck.new
puts "======before shuffle======"
puts deck

# デッキのシャッフル
deck = deck.shuffle!
puts "======after shuffle======"
puts deck

# デッキからカードを10枚引く
hand = hand.draw(deck,10)
puts "======after draw======"
puts hand

# handオブジェクトを配列に型変換
target = hand.to_a

# FIXME （targetを昇順にソートしてください）

def quick_sort(sort_number)
  return sort_number if sort_number.size < 2
  target = sort_number.shift
  smallers = []
  biggers = []
  sort_number.each do |sort_numbers|
      if sort_numbers < target
          smallers << sort_numbers
      else
          biggers << sort_numbers
      end
  end
  quick_sort(smallers) + [target] + quick_sort(biggers)
end

target = quick_sort(target)
# hand = hand.sort!は使用しないでください。
# 並び替えた配列でHandオブジェクトのインスタンスを作成
hand = Hand.new(target)
puts "======after sort======"
puts hand
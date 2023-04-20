require "./calculate"
require "./cards"

calculate = Calculate.new
cards = Cards.new
deck = cards.create_deck

# suits = ['ハート', 'スペード', 'ダイヤ', 'クラブ']
# ranks = ['A', '2', '3', '4', '5', '6', '7', '8', '9', '10', 'J', 'Q', 'K']
# deck = suits.product(ranks)
# deck.shuffle!

# player_cards = []
# dealer_cards = []

puts "ブラックジャックを開始します。"

player_cards = []
dealer_cards = []

player_cards << deck.pop
puts "あなたの引いたカードは#{player_cards[0][0]}の#{player_cards[0][1]}です。"
player_cards << deck.pop
puts "あなたの引いたカードは#{player_cards[1][0]}の#{player_cards[1][1]}です。"

dealer_cards << deck.pop
puts "ディーラーの引いたカードは#{dealer_cards[0][0]}の#{dealer_cards[0][1]}です。"
dealer_cards << deck.pop
puts "ディーラーの引いた2枚目のカードは分かりません。"

player_total = calculate.calculate_total(player_cards)
dealer_total = calculate.calculate_total(dealer_cards)


while player_total < 21
    puts "あなたの現在の得点は#{player_total}です。カードを引きますか？(y/n)"
    action = gets.chomp

    if action == "y"
        player_cards << deck.pop
        puts "あなたの引いたカードは#{player_cards.last[0]}の#{player_cards.last[1]}です。"
        player_total = calculate.calculate_total(player_cards)

    elsif action == "n"
        break
    else
        puts "yかnを入力してください。"
    end
end

if player_total == 21
    puts "ブラックジャックであなたの勝ちです！"
    exit
end

if player_total > 21
    puts "バーストであなたの負けです。"
    exit
end

# ディーラーのターン
puts "ディーラーの2枚目のカードは#{dealer_cards[1][0]}の#{dealer_cards[1][1]}でした。"
puts "ディーラーの現在の得点は#{dealer_total}です。"
while dealer_total < 17
    dealer_cards << deck.pop
    puts "ディーラーの引いたカードは#{dealer_cards.last[0]}の#{dealer_cards.last[1]}です。"
    dealer_total = calculate.calculate_total(dealer_cards)

    if dealer_total > 21
        puts "ディーラーはバーストであなたの勝ちです！"
        exit
    end
end

puts "ディーラーの合計点は#{dealer_total}です。"


if player_total > dealer_total
    puts "あなたの勝ちです！"
elsif player_total < dealer_total
    puts "あなたの負けです。"
else
    puts "引き分けです。"
end

puts "ブラックジャックを終了します。"

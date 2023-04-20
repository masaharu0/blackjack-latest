class Cards
    def create_deck
        suits = ['ハート', 'スペード', 'ダイヤ', 'クラブ']
        ranks = ['A', '2', '3', '4', '5', '6', '7', '8', '9', '10', 'J', 'Q', 'K']
        deck = suits.product(ranks)
        deck.shuffle!
    end
end

class Calculate
    def calculate_total(cards)
        total = 0
        aces = 0

        cards.each do |card|
            if card[1] == 'A'
                aces += 1
                total += 11
            elsif card[1].to_i == 0
                total += 10
            else
                total += card[1].to_i
            end
        end

        aces.times do
            total -= 10 if total > 21
        end
        total
    end
end

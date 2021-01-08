class Dice
    
    attr_reader :previous_rolls

    def initialize
        @previous_rolls = []
    end 

    def roll(number_of_dice = 1)
        score = 0
        number_of_dice.times { score += rand(1..6) }
        @previous_rolls << score
        score
    end 

    def current_score 
        @previous_rolls.sum 
    end 

end
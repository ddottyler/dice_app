require 'dice'

describe Dice do

    # it 'dice can be rolled' do 
    # expect(subject).to respond_to :roll
    # end 

    it {is_expected.to respond_to :roll}

    it 'rolls between x & 6*x, where x is the number of dice rolled' do
        arr = [rand(1..6), rand(7..10), rand(200..500)]
        arr.each do |x|
            expect(subject.roll(x)).to be_between(x, 6 * x)
        end
    end

    it 'rolls random number between 1 & 6' do 
        array_1 = []
        array_2 =[]

        10.times do 
        array_1 << subject.roll
        end
        
        10.times do 
        array_2 << subject.roll
        end

        expect(array_1).not_to eq array_2
    end

    describe '#roll' do 
        it { is_expected.to respond_to(:roll).with(1).argument}
    end 

    describe '#previous_rolls' do
        dice = Dice.new
        rolls_arr = []
        20.times { rolls_arr << dice.roll }
        it "gives us an array of the rolls we've made" do
            expect(dice.previous_rolls).to eq rolls_arr
        end
    end

    describe '#current_score' do
        dice = Dice.new
        rolls_arr = []
        10.times { dice.roll }
        it "gives us sum of previous rolls" do
            expect(dice.current_score).to eq dice.previous_rolls.sum 
        end
    end 

end 
class Dice
  def initialize
    @last_roll = []
  end
  
  def roll
    rand(1..6)
  end

  def roll_multiple_dice(number)
    number.times do
      @last_roll << roll
    end
    @last_roll
  end

  def show_roll
    puts "You rolled:"
    @last_roll.each do |roll|
      puts roll
    end
    puts "on #{@last_roll.length} dice"
  end
end
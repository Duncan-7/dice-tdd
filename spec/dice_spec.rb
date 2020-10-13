require 'dice'

describe Dice do
  it 'receives the #roll method' do
    expect(subject).to respond_to(:roll)
  end

  describe '#roll' do
    it 'should return a number between 1 and 6' do
      expect(subject.roll).to be_between(1, 6)
    end

    it 'should return a random number' do
      allow(subject).to receive(:rand).and_return(3)
      expect(subject.roll).to eq(3)
    end

    it 'should return a random number' do
      allow(subject).to receive(:rand).and_return(5)
      expect(subject.roll).to eq(5)
    end
  end

  it 'receives the #roll_multiple_dice method' do
    expect(subject).to respond_to(:roll_multiple_dice)
  end

  describe '#roll_multiple_dice' do
    it 'returns the results of a number of dice equal to the argument its passed' do
      allow(subject).to receive(:rand).and_return(3)
      expect(subject.roll_multiple_dice(2)).to eq([3,3])
    end

    it 'returns the results of a number of dice equal to the argument its passed' do
      allow(subject).to receive(:rand).and_return(1)
      expect(subject.roll_multiple_dice(4)).to eq([1,1,1,1])
    end
  end

  it 'receives the #show_roll method' do
    expect(subject).to respond_to(:show_roll)
  end

  describe '#show_roll' do
    it 'displays the results of 1 dice roll to the console' do
      allow(subject).to receive(:rand).and_return(1)
      subject.roll_multiple_dice(1)
      expect{subject.show_roll}.to output("You rolled:\n1\non 1 dice\n").to_stdout
    end

    it 'displays the results of 3 dice roll to the console' do
      allow(subject).to receive(:rand).and_return(1)
      subject.roll_multiple_dice(3)
      expect{subject.show_roll}.to output("You rolled:\n1\n1\n1\non 3 dice\n").to_stdout
    end

    it 'displays the results of 5 dice roll to the console' do
      allow(subject).to receive(:rand).and_return(5)
      subject.roll_multiple_dice(5)
      expect{subject.show_roll}.to output("You rolled:\n5\n5\n5\n5\n5\non 5 dice\n").to_stdout
    end
  end
end
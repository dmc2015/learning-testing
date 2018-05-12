class Card

  attr_reader :suit, :rank
  def initialize(suit:, rank:)
    @suit = suit
    @rank = case rank
    when :jack then 11
    when :queen then 12
    when :king then 13
    else rank
    end
  end

  def suit
    @suit
  end

  def rank
    @rank
  end
end


RSpec.describe 'a playing card' do

  it 'has a suit' do
    raise unless Card.new(suit: :spades, rank: 4).suit == :spades
  end

  it 'needs a rank' do
    raise unless Card.new(suit: :spades, rank: 4).rank == 4
  end

  describe 'a jack' do
    it 'ranks higher than a 10' do
      lower = Card.new(suit: :spades, rank: 10)
      higher = Card.new(suit: :spades, rank: :jack)
      raise if higher.rank < lower.rank
    end

    it 'ranks at as 11' do
      raise unless Card.new(suit: :spades, rank: :jack).rank == 11
    end
  end

  describe 'a queen' do
    it 'ranks higher than a 11' do
      lower = Card.new(suit: :spades, rank: 11)
      higher = Card.new(suit: :spades, rank: :queen)
      raise if higher.rank < lower.rank
    end

    it 'ranks at as 11' do
      raise unless Card.new(suit: :spades, rank: :queen).rank == 12
    end
  end

  describe 'a king' do
    it 'ranks higher than a 12' do
      lower = Card.new(suit: :spades, rank: 12)
      higher = Card.new(suit: :spades, rank: :king)
      raise if higher.rank < lower.rank
    end

    it 'ranks at as 11' do
      raise unless Card.new(suit: :spades, rank: :king).rank == 13
    end
  end

end

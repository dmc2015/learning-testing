require 'spec_helper'
require 'card'
require 'pry-byebug'
require 'set'

#unit test
describe Card, :unit do
  def card(params= {})
    defaults = {
      suit: :hearts,
      rank: 7
    }
    Card.build(*defaults.merge(params).values_at(:suit, :rank))
  end


  it 'has a suit' do
    # raise unless card(suit: :spades).suit == :spades
    expect(card(suit: :spades).suit).to eq(:spades)
  end

  it 'needs a rank' do
    # raise unless card(rank: 4).rank == 4
    expect(card(rank: 4).rank).to eq 4

  end

  context 'equality' do

    subject { card(suit: :spades, rank: 4) }

    let(:other) { card(suit: :spades, rank: 4) }

    it 'a hash is equal to a hash of same suit and rank' do
      # raise unless subject.cards_equal(other)
      expect(subject.cards_equal(other)).to eq true
    end

    it 'a set is equal to a set of same suit and rank' do
      # raise unless Set.new([subject, other]).size == 1
      expect(Set.new([subject, other]).size).to eq(1)
    end

    shared_examples_for 'an unequal card' do
      it 'a hash is not equal to another card' do
        # raise unless subject.cards_equal(other) == false
        expect(subject.cards_equal(other)).to eq false

      end

      it 'a set is not equal to another card' do
        # raise unless Set.new([subject, other]).size == 2
        expect(Set.new([subject, other]).size).to eq 2

      end
    end

    describe 'comparing a card of a different suit' do
      let(:other) { card(suit: :heart, rank: 5) }
      it_behaves_like 'an unequal card'
    end

    describe 'comparing a card of a different rank' do
      let(:other) { card(suit: :heart, rank: 5) }
      it_behaves_like 'an unequal card'
    end

  end

  describe 'a jack' do
    it 'ranks higher than a 10' do
      lower = card(rank: 10)
      higher = card(rank: :jack)
      # raise if higher.rank < lower.rank
      expect(higher.rank).to be > lower.rank
    end
    it 'ranks at as 11' do
      # raise unless card(rank: :jack).rank == 11
      expect(card(rank: :jack).rank).to eq 11

    end
  end

  describe 'a queen' do
    it 'ranks higher than a 11' do
      lower = card(rank: :jack)
      higher = card(rank: :queen)
      # raise if higher.rank < lower.rank
      expect(higher.rank).to be > lower.rank

    end
    it 'ranks at as 12' do
      # raise unless card(suit: :spades, rank: :queen).rank == 12
      expect(card(suit: :spades, rank: :queen).rank).to eq 12

    end
  end

  describe 'a king' do
    it 'ranks higher than a 12' do
      lower = card(rank: :queen)
      higher = card(rank: :king)
      # raise if higher.rank < lower.rank
      expect(higher.rank).to be > lower.rank

    end
    it 'ranks at as 13' do
      # raise unless card(rank: :king).rank == 13
      expect(card(rank: :king).rank).to eq 13

    end
  end





end

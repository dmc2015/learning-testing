#TYPES OF TESTS
unit tests
- does a specific method/class/ perform the expected behavior

integration tests
- tests for models
- testing an aspect of the application that allows other features towork

end to end tests
- does the ui behave the way it is expected to


acceptance tests
- does the whole application work and all the aspects the lend to its functioning
- exercise code across many components, carrying out actions that the user completes

there should be more unit tests than integration and more integration tests than acceptance tests




#ALIASES
context alias => describe
example alias => it

#HOOKS
hook types
before
after
around

hooks can make tests confusing


#MATCHERS
to eq
not_to eq
to_to eq
to be !=
to be ==
to be <
to be >
to be >=
to be <=
match (for strings)
start_with (for strings)
be_truthy
be_falsey
respond_to (supports a method)
to receive




#COLLECTON MATCHERS
include
to all
to all(have_attributes

#AGGREGATE FAILURES
#from cards.rb
def self.from_string(value)
    # Get final character in string
    short_suit = value[-1]

    # Map it to a suit
    suit = {
      "H" => :hearts,
      "D" => :diamonds,
      "S" => :spades,
      "C" => :clubs,
    }.fetch(short_suit)

    # Map remainder to a face card, or fallback to numeric
    rank = {
      'A' => :ace,
      'K' => :king,
      'Q' => :queen,
      'J' => :jack,
    }.fetch(value[0]) { value[0..-2].to_i }

    Card.build(suit, rank)
  end


describe '.from_string', :aggregate_failures do
    def self.it_parses(string, as: as)
      it "parses #{string}" do
        expect(Card.from_string(string)).to eq(as)
      end
    end

    it_parses "7H", as: Card.build(:hearts, 7)
    it_parses "10S", as: Card.build(:spades, 10)
    it_parses "JC", as: Card.build(:clubs, :jack)
    it_parses "QC", as: Card.build(:clubs, :queen)
    it_parses "KC", as: Card.build(:clubs, :king)
  end

#CHAINGING EXPECTATIONS/BOOLEAN COMPOSITION
expect(buffer).to include("You won").or include("You Lost")
expect(buffer).to include("You won").and include("You Lost")


#WHY YOU SHOULDN'T USE SHOULD
(1 + 1).should == 2 == expect(1 + 1).to eq(2)
- has weird inconsistencies
- requires monkey patching every object
- can generate warnings
- needs workarounds for operator precedence
- should will be moved in to a separate gem

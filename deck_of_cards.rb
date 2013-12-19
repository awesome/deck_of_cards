# Deck of Playing Cards
# Raleigh St. Clair
# restc@icloud.com, github: @restc



class Card
  def initialize(suit, card_number)
    @suit, @card_number = suit.downcase.intern, card_number
  end

  def validate_number(card_number)
    unless list_card_numbers.include? card_number
      return false
    end
  end

  def self.list_card_numbers
    %w[2 3 4 5 6 7 8 9 10 J Q K A]
  end

  def self.possible_cards?
    Card.list_card_numbers
  end
end


# Define logic for a suit
class Suit
  def initialize(suit)
    if validate_suit(suit) == false
      return "Not a valid suit, must be Hearts, Clubs, Spades or Diamonds."
    else
      @suit = suit
    end
  end

  def validate_suit(suit)
    s = suit.downcase.to_sym
    unless all_suits.include? s
      return false
    end

  end

  def self.all_suits
    [:hearts, :clubs, :diamonds, :spades]
  end
end


# Deck Class • Assemble a deck of 52 cards
class Deck
  def initialize
    make_deck
  end

  def make_deck
    full_deck = {}
    suits = Suit.all_suits
    cards = Card.list_card_numbers
    suits.each do |suit|
      full_deck[suit] = Hash.new(suit)
      cards.each do |card|
        full_deck[suit][card] = suit
      end 
    end 
    return full_deck
  end 

  def print_deck
    puts "Deck of cards"
    (0..4).each do |i|
      puts "#{@full_deck.keys[i].to_s.capitalize}"
      puts "#{@full_deck.keys[i]}"
    end
  end 

end 

def format_deck(hash, level = 0)
  hash.each do |key, value|
    puts "%s : %s" % [ "    " *level, key,
      value.kind_of?(Hash) ? format_deck( value, level + 1) : value
    ]
  end
end 

deck = Deck.new
deck_of_cards = deck.make_deck
puts deck_of_cards
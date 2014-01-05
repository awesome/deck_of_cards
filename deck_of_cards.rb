
# Deck of Playing Cards
# Raleigh St. Clair
# restc@icloud.com, github: @restc




# Define the Card as an array of numbers plus a suit and include validation methods
class Card
  attr_reader :number, :suit

  def initialize(suit, number)
    if !accepted_suits.include? suit.to_sym
      return DeckErrors.invalid_suit
    elsif !valid_numbers.include? number
      return DeckErrors.invalid_number
    else
      @suit, @number = suit, number
    end
  end

  def self.valid_numbers
    (1..13).to_a
  end

  def self.valid_suits
    [ :hearts, :spades, :diamonds, :clubs ]
  end

  def valid_numbers
    self.class.valid_numbers
  end

  def valid_suits
    self.class.valid_suits
  end

  def self.accepted_suits
    [ 'hearts', 'H', 'h', 'spades', 'S', 's', 'diamonds', 'D', 'd', 'clubs', 'C', 'c' ]
  end

  def accepted_suits
    [ :hearts, 'H', 'h', :spades, 'S', 's', :diamonds, 'D', 'd', :clubs, 'C', 'c' ]
  end

  def main_suits
    :valid_suits.each { |v| v if v.is_a? Symbol }
  end

  # def format_number
  #   case @number
  #   when 1
  #     "Ace of " + @suit
  #   when 11
  #     "Jack of " + @suit
  #   when 12
  #     "Queen of " + @suit
  #   when 13
  #     "King of " + @suit
  #   else
  #     "#{@number.to_s} of " + @suit
  #   end
  # end

  # def format_suit
  #   case @suit
  #   when 'H'
  #     :hearts
  #   when 'S'
  #     :spades
  #   when 'D'
  #     :diamonds
  #   when 'C' 
  #     :clubs
  #   when 'h'
  #     :hearts
  #   when 's'
  #     :spades
  #   when 'd'
  #     :diamonds
  #   when 'c'
  #     :clubs
  #   else
  #     @suit
  #   end
  # end

end # Card class

class Fixnum
  def format_number
    case @number
    when 1
      "Ace of " + @suit
    when 11
      "Jack of " + @suit
    when 12
      "Queen of " + @suit
    when 13
      "King of " + @suit
    else
      "#{@number.to_s} of " + @suit
    end
  end
end

class Deck
  # This will gather the cards needed to create a full deck
  # should gather 52 cards in four different suits, evenly 
  # distributing the cards so there are 13 per suit, 1-13
  include Enumerable
  # This allows enumerable methods to be used on Arrays

  attr_reader :deck



  # This works and returns a deck object, composed of an array of cards.
  # To access array, call `.deck` on new Deck object, i.e.:

  # => # full_deck = Deck.new
  # => # deck = full_deck.deck => returns Array

  def initialize
  #   Could add options so that game can be created with different amounts of cards depending upon the game being created
    #val_s = Card.valid_suits
    #val_n = Card.valid_numbers
    deck = []
    val_s = Card.valid_suits #[:hearts, :clubs, :diamonds, :spades]
    val_n = Card.valid_numbers #(1..13).to_a
    val_s.each do |vs|
      val_n.each do |vn|
        deck.push Card.new(vs, vn)
      end
    end
    @deck = deck
  end


  def self.shuffle
    random_gen = Random.new()
    record = []
    52.times do 
      r = random_gen.rand(52) 
      if record.include? r
        random_gen.rand(52)
      else
        record << r
      end
    end
    puts record
  end

end # End Deck class



class DeckErrors < RuntimeError
  def self.invalid_suit
    puts "Please use a valid suit: Hearts, Clubs, Diamonds, or Spades."
  end
  
  def self.invalid_number
    puts "Please use a valid number: 2-10, Jack, Queen, King or Ace."
  end
end #DeckErrors


=begin
  

  
=end




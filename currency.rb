require 'byebug'
class Currency
  attr_accessor :number, :code, :hash
  def initialize(amount)
    @amount = amount
    @hash =  {"$" => :USD,
              "€"  => :EUR,
              "¥"  => :JPY}
    @code = ""

  end

  def type
    if @hash.has_key?(@amount.chars.first)
      @code = @hash[@amount.chars.first]
      puts @code
    end
  end

  def +(other)
    if @code == other.code
      puts @amount.to_f + other.number.to_f
    else
      puts "The currencies are different"
    end
  end

  def -(other)
    if @code == other.code
      puts @amount.to_f - other.number.to_f
    else
      puts "The currencies are different"
    end
  end

  def *(other)
    if @code == other.code
      puts @amount.to_f * other.number.to_f
    else
      puts "The currencies are different"
    end
  end

  def ==(other)
    if @code == other.code
      puts @amount.to_f == other.number.to_f
    else
      puts "The currencies are different"
    end
  end

end


myAmount = Currency.new("$4.0")
myAmount.type
otherAmount = Currency.new("$4.0")
otherAmount.type

puts myAmount == otherAmount

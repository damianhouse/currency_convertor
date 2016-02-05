require 'byebug'
class Currency
  def initialize(amount)
    @amount = amount
    @hash =  {"$" => :USD,
              "€"  => :EUR,
              "¥"  => :JPY}
  end

  def number
    @amount
  end

  def code
    @code
  end

  def hash
    @hash
  end

  def +(other)
    puts @amount.to_f + other.number.to_f
  end

  def -(other)
    puts @amount.to_f - other.number.to_f
  end

  def type
    if @hash.has_key?(@amount.chars.first)
      puts "WE GOT THIS SHIT B!"
    end
  end

end


myAmount = Currency.new("4.0")
myAmount.type
otherAmount = Currency.new("3.0")
otherAmount.type

puts myAmount - otherAmount

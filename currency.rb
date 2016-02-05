require 'byebug'
class Currency
  def initialize(amount)
    @amount = amount
  end

  def +(other)
    puts @amount.to_f + other.number.to_f
  end

  def number
    @amount
  end

  def code
    @code
  end

  def type
    if @amount.include?("$")
      @amount = @amount[1..-1].to_f
      @code = :USD
    elsif @amount.include?("€")
      @amount = @amount[1..-1].to_f
      @code = :EUR
    elsif @amount.include?("¥")
      @amount = @amount[1..-1].to_f
      @code = :JPY
    elsif (@amount.number.to_f.to_s == 0.0) || (@amount.number.to_i.to_s == 0)
      puts "UndefinedCurrencyInClass"
    else
      @amount.to_f
    end
  end
end


myAmount = Currency.new("1.4")
myAmount.type
otherAmount = Currency.new("$2.0")
otherAmount.type

puts myAmount + otherAmount

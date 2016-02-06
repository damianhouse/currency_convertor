require './DifferentCurrencyCodeError'

class Currency

  attr_accessor :code, :hash, :no_code, :amount
  COUNTRYCODES = {"$" => :USD,"€" => :EUR,"¥" => :JPY,}

  def initialize(amount)
    @amount = amount
    @code = ""
    @no_code = ""
  end

  def type
    if COUNTRYCODES.has_key?(@amount.chars.first)
      @code = COUNTRYCODES[@amount.chars.first]
    elsif COUNTRYCODES.has_key?(@amount.chars.first)
      raise DifferentCurrencyCodeError
    else (@amount.chars.first) == Fixnum || (@amount.chars.first) == Float
      @no_code = @amount
    end
  end

  def number
    if @code != ""
      @number = @amount[1..-1]
    end
    @number
  end

  def +(other)
    if @code == other.code
      Currency.new((@amount[1..-1]).to_f + other.number.to_f).amount
    elsif @no_code != ""
      Currency.new(@amount.to_f + @no_code.to_f).amount
    else
      raise DifferentCurrencyCodeError
    end
  end

  def -(other)
    if @code == other.code
      Currency.new((@amount[1..-1]).to_f - other.number.to_f).amount
    elsif @no_code != ""
      Currency.new(@amount.to_f - other.number.to_f).amount
    else
      raise DifferentCurrencyCodeError
    end
  end

  def *(other)
    if @code == other.code
      Currency.new((@amount[1..-1]).to_f * other.number.to_f).amount
    elsif @no_code != ""
      Currency.new(@amount.to_f * other.number.to_f).amount
    else
      raise DifferentCurrencyCodeError
    end
  end

  def ==(other)
    if @code == other.code
      return true unless @amount != other.amount
      puts "The amounts aren't equal"
    else
      raise DifferentCurrencyCodeError
    end
  end

end


myAmount = Currency.new("$16.0")
myAmount.type
otherAmount = Currency.new("$4.0")
otherAmount.type

puts myAmount == otherAmount

require 'byebug'
class Currency
  def initialize(amount)
    @amount = amount
  end

  def type
    if @amount.include?("$")
      @amount[1..-1]
      @amount_type = :USD
      @no_sym_amount = @amount[1..-1]
    elsif @amount.include?("€")
      @amount[1..-1]
      @amount_type = :EUR
      @no_sym_amount = @amount[1..-1]
    elsif @amount.include?("¥")
      @amount[1..-1]
      @amount_type = :JPY
      @no_sym_amount = @amount[1..-1]
    else
      puts "DifferentCountryCodeError"
    end
  end
end

myAmount = Currency.new("€1.4")
print myAmount.type
